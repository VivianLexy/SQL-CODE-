

--(COMMON TABLE EXPRESSION)CTEs 
--Temporary named result set created from a simple select statement 

WITH CTE_Example AS 
(
    SELECT 
        gender, 
        AVG(salary) AS avg_sal, 
        MAX(salary) AS max_sal, 
        MIN(salary) AS min_sal, 
        COUNT(salary) AS salary_count
    FROM 
        employee_demographics dem 
    JOIN 
        employee_salary sal ON dem.employee_id = sal.employee_id
    GROUP BY 
        gender
)
SELECT 
    gender, 
    avg_sal, 
    max_sal, 
    min_sal, 
    salary_count
FROM 
    CTE_Example;
;

SELECT AVG(avg_sal)
FROM (SELECT gender, AVG(salary) avg_sal, MAX(salary) max_sal, MIN(salary)min_sal, COUNT(salary) salary_count
FROM employee_demographics dem 
JOIN employee_salary sal 
    ON dem.employee_id = sal.employee_id
GROUP BY gender
) example_subquery
;

WITH CTE_Example AS 
(
SELECT employee_id, gender,birth_date
FROM employee_demographics
WHERE birth_date > '1985-01-01'
),
CTE_Example2 AS 
(
SELECT employee_id, salary
FROM employee_salary
WHERE salary > 50000
)
SELECT*
FROM CTE_Example
JOIN CTE_Example2
   ON CTE_Example.employee_id = CTE_Example2.employee_id;


--TEMPORARY TABLES
--CREATE TEMPORARY TABLE temp_table (
  --  first_name VARCHAR(50),
   -- last_name VARCHAR(50),
   -- favorite_movie VARCHAR(100));

CREATE TABLE #temp_table (
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    favorite_movie VARCHAR(100)
);

SELECT*
FROM #temp_table;

--Insert values into the #temptable 
INSERT INTO #temp_table
VALUES('Alex','Freberg','Lord of the Rings: The two Towers');

SELECT *
FROM #temp_table;

SELECT *
FROM employee_salary;

CREATE TABLE #salary_over_50k

SELECT *
FROM employee_salary
WHERE salary >= 50000;


SELECT *
FROM employee_salary;






































