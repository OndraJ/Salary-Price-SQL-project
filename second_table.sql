-- otazka c.5
CREATE OR REPLACE TABLE t_Ondra_Janek_project_SQL_secondary_final
	SELECT e.`year` ,
		   c.country,
		   e.GDP,
		   e.gini,
		   e.population 
	FROM countries c  
		JOIN economies e 
			ON c.country = e.country 
	WHERE c.continent = 'Europe' AND 
		  e.`year`  BETWEEN '2000' AND '2021'
	ORDER BY c.country, 
			 e.`year`
			  
-- pomocna tabulka GDP 
CREATE OR REPLACE TABLE t_czech_economy
	SELECT `year` AS 'Year',
		   GDP 
	FROM t_Ondra_Janek_project_SQL_secondary_final
	WHERE country = 'Czech Republic'
	ORDER BY `year` ASC

-- pomocna tabulka AVG salary
CREATE OR REPLACE TABLE t_second_salary
	SELECT `year`,
			ROUND(AVG(`Salary/price`),1) AS 'Avarage salary'
	FROM t_salary ts  
	GROUP BY `year` 

-- pomocna tabulka AVF Food
CREATE OR REPLACE TABLE t_second_food
	SELECT `year`,
			ROUND(AVG(`Salary/price`),1) AS 'Avarage Price'
	FROM t_food tf
	GROUP BY `year`

-- tabulka pro vizualizaci otazky è.5
CREATE OR REPLACE TABLE t_visualization_GDP_Salary_Price
	SELECT ts.`year`,
		   ce.`GDP`,
		   ts.`Avarage salary`,
		   tf.`Avarage Price` 
	FROM t_second_salary ts
	LEFT OUTER  JOIN t_czech_economy ce
		ON ts.`year` = ce.`year`
	LEFT OUTER JOIN t_second_food tf
		ON ce.`year` = tf.`year`
	ORDER BY ts.`year`


	  

