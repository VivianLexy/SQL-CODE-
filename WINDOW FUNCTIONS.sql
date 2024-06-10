
--WINDOW FUNCTIONS 
--The query  analyzes the average salary differences between male and female employees by joining the
--employee_demographics and employee_salary tables on the employee_id column and grouping the results by gender.
SELECT gender, AVG(salary) AS Avg_salary
FROM employee_demographics dem
JOIN employee_salary sal 
     ON dem.employee_id = sal.employee_id
GROUP BY gender; 

--This function calculates the average salary for each gender group without grouping the entire result set. 
--It provides a way to include aggregated information alongside individual rows in the result set.
SELECT gender, AVG(salary) OVER (PARTITION BY gender) AS Avg_salary
FROM employee_demographics dem 
JOIN employee_salary sal 
   ON dem.employee_id = sal.employee_id;

--Average salary partitioned by average 
SELECT dem.first_name, dem.last_name, gender, AVG(salary) OVER (PARTITION BY gender) AS Avg_salary
FROM employee_demographics dem 
JOIN employee_salary sal 
   ON dem.employee_id = sal.employee_id;

--Sum salary partitioned by gender 
SELECT dem.first_name, dem.last_name, gender, SUM(salary) OVER (PARTITION BY gender) AS Avg_salary
FROM employee_demographics dem 
JOIN employee_salary sal 
   ON dem.employee_id = sal.employee_id;

--The query calculates the rolling total salary for each employee, partitioned by gender and ordered by employee_id. 
SELECT dem.first_name, dem.last_name, gender,salary, 
SUM(salary) OVER (PARTITION BY gender ORDER BY dem.employee_id) AS Rolling_Total
FROM employee_demographics dem 
JOIN employee_salary sal 
   ON dem.employee_id = sal.employee_id;


--The query joins the employee_demographics and employee_salary tables on the employee_id column and 
--retrieves the first name, last name, gender, salary, and a row number for each employee. 
--The row numbers are assigned based on the order of the employee_id.
--Assigns a unique sequential integer to each row within the partition of gender, starting at 1.
--If two rows have the same salary, they will get different sequential numbers.
--Does not handle ties in salary the same way as RANK and DENSE_RANK
SELECT dem.first_name, dem.last_name,gender, salary,
ROW_NUMBER() OVER(ORDER BY dem.employee_id) AS row_num
FROM employee_demographics dem 
JOIN employee_salary sal  ON dem.employee_id = sal.employee_id;

--Assigns two rows have the same salary, they receive the same rank, and the next rank is skipped.
--if two employees have the highest salary, both will receive rank 1, and the next rank assigned will be 3.
--Rank number assign same numbers( next number positionally)
SELECT dem.employee_id, dem.first_name, dem.last_name,gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_num,
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) rank_num
FROM employee_demographics dem 
JOIN employee_salary sal  ON dem.employee_id = sal.employee_id;	

--If two rows have the same salary, they receive the same rank, and the next rank continues sequentially without skipping any rank
SELECT dem.employee_id, dem.first_name, dem.last_name,gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_num,
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) rank_num,
DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary DESC) dense_rank_num
FROM employee_demographics dem 
JOIN employee_salary sal  ON dem.employee_id = sal.employee_id;





















