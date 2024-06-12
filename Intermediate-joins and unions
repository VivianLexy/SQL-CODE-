

--JOINS 

SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

--JOIN BOTH TABLES theemployee demographics and employee salary 
SELECT *
FROM employee_demographics
INNER JOIN employee_salary
ON employee_demographics.employee_id = employee_salary.employee_id; 

--WE CAN USE ALIASES TOO 
SELECT *
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
ON dem.employee_id = sal.employee_id;

--Select actual columns 
SELECT dem.employee_id, age,occupation
FROM employee_demographics AS dem 
INNER JOIN employee_salary AS sal
   ON dem.employee_id = sal.employee_id;

--OUTER JOINS : LEFT OUTER JOIN
--The left join will take everything from the left table even if theres no match in the join 
SELECT *
FROM employee_demographics AS dem 
LEFT OUTER JOIN employee_salary AS sal
  ON dem.employee_id = sal.employee_id;

--THE RIGHT OUTER JOIN
--Takes everything in the employee salary table and if theres no match then it will bring back NULL 
SELECT *
FROM employee_demographics AS dem 
RIGHT OUTER JOIN employee_salary AS sal
  ON dem.employee_id = sal.employee_id;

--SELF JOIN (JOINS A TABLE TO ITSELF)
--The code below performs an inner join between the employee_salary table (aliased as emp1) and itself (aliased as emp2). 
SELECT *
FROM employee_salary emp1 
JOIN employee_salary emp2
  ON emp1.employee_id = emp2.employee_id ;

--ASSIGN AN EMPLOYEE ID TO THE NEXT EMPLOYEE 
SELECT *
FROM employee_salary emp1 
JOIN employee_salary emp2
  ON emp1.employee_id + 1 = emp2.employee_id;

  --Specify the columns we want 
  SELECT emp1.employee_id AS emp_santa,
  emp1.first_name AS first_name_santa,
  emp1.last_name AS last_name_santa,
  emp2.employee_id AS emp_name, 
  emp2.first_name AS first_name_emp,
  emp2.last_name AS last_name_emp
  FROM employee_salary emp1 
  JOIN employee_salary emp2 
     ON emp1.employee_id + 1 = emp2.employee_id

--JOINING MULTILPE TABLES TOGETHER 
--Join all the three tables together 
SELECT *
FROM employee_demographics AS dem 
INNER JOIN employee_salary AS sal
   ON dem.employee_id = sal.employee_id
 INNER JOIN parks_departments pd 
ON sal.dept_id = pd.department_id ;

SELECT *
FROM parks_departments;





--UNIONS 
--Combines the data from the result of two or more into a single distinct set 
SELECT  first_name, last_name 
from employee_demographics
UNION 
SELECT  first_name, last_name
FROM employee_salary;

--ALL THE VALUES WITHOUT REMOVING THE DUPLICATES 
SELECT  first_name, last_name 
from employee_demographics
UNION ALL
SELECT  first_name, last_name
FROM employee_salary;

--Select first &last name where age is > 50
SELECT  first_name, last_name 
from employee_demographics
WHERE age > 50;

--Select first &last name where age is > 50 and label as old and highly paid employee 
SELECT  first_name, last_name, 'Old' AS label
from employee_demographics
WHERE age > 50
UNION 
SELECT first_name ,last_name, 'Highly Paid Employee' AS label
FROM employee_salary
WHERE salary > 70000;


--Select first &last name where age is > 50 and label as old and highly paid employee 
SELECT  first_name, last_name, 'Old Man' AS label
from employee_demographics
WHERE age > 40 AND gender = 'Male'
UNION 
SELECT  first_name, last_name, 'Old Lady' AS label
FROM employee_demographics
WHERE age > 40 AND gender = 'Female'
UNION
SELECT first_name ,last_name, 'Highly Paid Employee' AS label
FROM employee_salary
WHERE salary > 70000
ORDER BY first_name, last_name;













