

--HAVING VS WHERE STATEMENTS 
SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender
HAVING AVG(age) > 40 
;

--Occupations like managers and have avg salary 75000
SELECT occupation, AVG(salary)
FROM employee_salary
WHERE occupation LIKE '%manager%'
GROUP BY occupation 
HAVING AVG(salary) > 75000
;

--LIMIT + ALIASING 
--Top 3 columns from employee demographics 
--Limit was not working for me so i checked on W3C and they suggested top 
SELECT TOP 3*
FROM employee_demographics

--Select the top 3 and then order by age 
SELECT TOP 3 *
FROM employee_demographics
ORDER BY age DESC

--ALIASING 
SELECT gender, AVG(age) AS avg_age
FROM employee_demographics 
GROUP BY gender 

SELECT gender, AVG(age) 
FROM employee_demographics
GROUP BY gender
HAVING AVG(age) > 40;


