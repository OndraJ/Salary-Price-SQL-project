--  tabulka mezd pro sjednoceni
CREATE OR REPLACE TABLE t_salary 
	SELECT cpib.name AS 'Name',
		   cp.payroll_year AS `year`,
		   ROUND(AVG(cp.value),0) AS 'Salary/price',
		   cpu.name AS 'Unit'
	FROM czechia_payroll cp 
	JOIN czechia_payroll_industry_branch cpib ON 
		 cp.industry_branch_code = cpib.code
	JOIN czechia_payroll_calculation cpc ON 
		 cp.calculation_code = cpc.code 
	JOIN czechia_payroll_unit cpu ON
		 cp.unit_code = cpu.code 
	JOIN czechia_payroll_value_type cpvt ON
		 cp.value_type_code = cpvt.code 
	WHERE value IS NOT NULL AND 
		  cpc.name = 'pøepoètený' AND 
		  cpu.code = 200 AND 
		  cpvt.code = 5958
	GROUP BY cpib.name,
		     cp.payroll_year 
	ORDER BY cpib.name,
	 	     payroll_year ASC;

-- 	tabulka potravin pro sjednoceni
CREATE OR REPLACE TABLE t_food
	SELECT 
		  cpc.name AS 'Name',
		  YEAR(date_from) AS `year`,
		  ROUND(AVG(value),2) AS 'Salary/price', 
		  cpc.price_unit AS 'Unit'
	FROM czechia_price cp 
	JOIN czechia_price_category cpc ON
		 cp.category_code = cpc.code 
	WHERE 1 = 1
	GROUP BY cpc.name,
			 YEAR(date_from)
			 

-- sjednoceni tabulek
CREATE OR REPLACE TABLE t_Ondra_Janek_project_SQL_primary_final
	SELECT *
	FROM t_salary ts  
	UNION 
	SELECT *
	FROM t_food tf ;

-- otazka c.1 --> porovnání mezd v roce 2000 a 2021
SELECT *
FROM t_Ondra_Janek_project_SQL_primary_final
WHERE `Unit` = 'Kè'

-- otazka c.1 --> percentualni narust
SELECT *,
	   ROUND((Salary_2021 / (Salary_2000/100))-100,2)  AS 'Increase in %'
FROM (
SELECT Name,
	   MIN(CASE 
	   	   		WHEN `year` = 2000 THEN `Salary/price`
	   	   END) AS Salary_2000,
	   MAX(CASE 
	   	   		WHEN `year` = 2021 THEN `Salary/price`
	       END) AS Salary_2021
FROM t_Ondra_Janek_project_SQL_primary_final 
WHERE `Unit` = 'Kè' AND 
	  `year` IN (2000,2021) 
GROUP BY Name) AS Base

-- otazka c.2 --> potraviny v roce 2006
SELECT *,
		ROUND((Avg_salary_2006 / Bread_2006),0) AS 'Number of bread',
		ROUND((Avg_salary_2006 / Milk_2006),0) AS 'Number of milk'
FROM 
	(SELECT 
	      ROUND(AVG(CASE 
			       	    WHEN `Unit` = 'Kè'
			       	    THEN `Salary/price`
			         END)) AS Avg_salary_2006,
			    MAX(CASE
	    	            WHEN Name = 'Chléb konzumní kmínový'
	    	            THEN `Salary/price`
	                 END) AS Bread_2006,
	            MAX(CASE
	    	            WHEN Name = 'Mléko polotuèné pasterované'
	    	            THEN `Salary/price`
	                 END) AS Milk_2006
	FROM t_Ondra_Janek_project_SQL_primary_final
	WHERE `year` = 2006
	GROUP BY `year`) AS Base;


-- otazka c.2 --> potraviny v roce 2018
SELECT *,
		ROUND((Avg_salary_2006 / Bread_2006),0) AS 'Number of bread',
		ROUND((Avg_salary_2006 / Milk_2006),0) AS 'Number of milk'
FROM 
	(SELECT 
	      ROUND(AVG(CASE 
			       	    WHEN `Unit` = 'Kè'
			       	    THEN `Salary/price`
			         END)) AS Avg_salary_2006,
			    MAX(CASE
	    	            WHEN Name = 'Chléb konzumní kmínový'
	    	            THEN `Salary/price`
	                 END) AS Bread_2006,
	            MAX(CASE
	    	            WHEN Name = 'Mléko polotuèné pasterované'
	    	            THEN `Salary/price`
	                 END) AS Milk_2006
	FROM t_Ondra_Janek_project_SQL_primary_final
	WHERE `year` = 2018
	GROUP BY `year`) AS Base;

-- otazka c.3 --> percentualni narust cen potravin
SELECT *,
	   ROUND(100.0 * (1 - LEAD(`Salary/price`) OVER 
	   (PARTITION BY Name
	    ORDER BY `year` DESC) / `Salary/price`),2) AS 'Increase in %'
FROM t_Ondra_Janek_project_SQL_primary_final
WHERE `Unit` != 'Kè'
GROUP BY Name,
		 `year`


-- otazka c.4 --> percentualni narust mezd a cen potravin
SELECT `year`,
	   Avarage_salary,
 	   ROUND(100.0 * (1 - LEAD(Avarage_salary) OVER (ORDER BY `year` DESC) / Avarage_salary),2)
 	   		AS 'Increase of salary in %',
 	   Avarage_price,
 	   ROUND(100.0 * (1 - LEAD(Avarage_price) OVER (ORDER BY `year` DESC) / Avarage_price),2)
 	   		AS 'Increase of price in %'
FROM (
		SELECT `year` ,
			   ROUND(AVG(CASE 
					  		 WHEN `Unit` = 'Kè'
				   	   		 THEN `Salary/price`
			   	  		 END),2) AS Avarage_salary,
			   ROUND(AVG(CASE 
					  		 WHEN `Unit` != 'Kè'
				   	 	     THEN `Salary/price`
			   	 	     END),2) AS Avarage_price
		FROM t_Ondra_Janek_project_SQL_primary_final
		WHERE `year` BETWEEN '2006' AND '2018'
		GROUP BY `year`) AS Base
ORDER BY `year`;

-- tabulka pro vizualizaci otazky è.4
SELECT `year` ,
	   ROUND(AVG(CASE 
			  		 WHEN `Unit` = 'Kè'
		   	   		 THEN `Salary/price`
	   	  		 END),2) AS Avarage_salary,
	   ROUND(AVG(CASE 
			  		 WHEN `Unit` != 'Kè'
		   	 	     THEN `Salary/price`
	   	 	     END),2) AS Avarage_price
FROM t_Ondra_Janek_project_SQL_primary_final
WHERE `year` BETWEEN '2006' AND '2018'
GROUP BY `year`



