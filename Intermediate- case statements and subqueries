--Case Statements 
--This checks if the age is less than or equal to 30.If true, it returns 'Young'.
--If false, it returns NULL since no ELSE condition is specified.
SELECT first_name, last_name,
CASE 
WHEN age <= 30 THEN 'Young'
END 
FROM employee_demographics;

--If the age is less than 30 then your considered young and between 31 and 50 then your old 
SELECT first_name, last_name, age,
CASE 
WHEN age <= 30 THEN 'Young'
WHEN age BETWEEN 31 and 50 THEN 'Old'
END 
FROM employee_demographics;

--If the age is less than 30 then your considered young and between 31 and 50 then your old and above 50 your on deaths door 
SELECT first_name, last_name, age,
CASE 
WHEN age <= 30 THEN 'Young'
WHEN age BETWEEN 31 and 50 THEN 'Old'
WHEN age >= 50  THEN 'Your on deaths door'
END AS Age_bracket
FROM employee_demographics;


SELECT*
FROM employee_salary;
SELECT 
--Pay Increase and Bonus 
-- < 50000 = 5%
-- > 50000 = 7%
-- Finance = 10% bonus 

SELECT first_name, last_name, salary,
CASE 
    WHEN salary < 50000 THEN salary + (salary *  0.005)
    WHEN salary > 50000 THEN salary + (salary * 0.007)
END AS New_salary,
CASE 
   WHEN dept_id  = 6 THEN salary *.10
END AS Bonus
FROM employee_salary;

--SUBQUERIES
--The query retrieves all details (all columns) of employees from the employee_demographics table who are working in department 1
--according to the employee_salary table.
--A subquery is a query thats nested in another query 
SELECT *
FROM employee_demographics
WHERE employee_id IN 
                   (SELECT employee_id
				   FROM employee_salary
				   WHERE dept_id = 1) ;

--Query calculates the average salary from the employee column
SELECT first_name, last_name,salary,
(SELECT AVG(salary)
FROM employee_salary)
FROM employee_salary;

-- The query performs aggregation operations on the employee_demographics table, grouped by the gender column
SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender;


SELECT    AVG(max_age) AS avg_max_age
FROM  (SELECT gender, 
AVG(age) AS avg_age,  
MAX(age) AS max_age,
MIN(age) AS min_age,
COUNT(age) AS count_age
    FROM employee_demographics
    GROUP BY gender) AS Agg_table;






















