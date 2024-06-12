
--STORED PROCEDURE 
--Helps one group / multiple sql statements for reuse under  a common name, encapsulating common business logic within the database itself
--Save this in a procedure 
--This defines a stored procedure named large_salaries that will select all records from the employee_salary table 
--where the salary is greater than or equal to 50,000.
CREATE PROCEDURE large_salaries AS 
BEGIN
SELECT *
FROM employee_salary
WHERE salary >= 50000;

END

--To see the results 
--CALL large_salaries();
EXEC large_salaries;

--Both queries within a stored procedure using delimeters $$
CREATE PROCEDURE large_salaries2 AS
BEGIN 
   SELECT*
   FROM employee_salary 
   WHERE salary >= 50000;
   SELECT*
   FROM employee_salary
   WHERE salary >= 10000;
END 

EXEC large_salaries2;

-- Create the stored procedure
CREATE PROCEDURE large_salaries3
    @huggymuffin INT
AS
BEGIN
    SELECT salary
    FROM employee_salary
    WHERE employee_id = @huggymuffin;
END


-- To see the results
EXEC large_salaries3 @huggymuffin = 1;

--TRIGGERS AND EVENTS 
--Allows you to specify sql actions that should be executed automatically when a specific event occurs in the database

SELECT *
FROM employee_demographics;

SELECT*
FROM employee_salary;

-- Create the trigger
--create a trigger that inserts data into employee_demographics 
--whenever a new row is inserted into employee_salary.
CREATE TRIGGER employee_insert 
ON employee_salary
AFTER INSERT
AS
BEGIN
    INSERT INTO employee_demographics(employee_id, first_name, last_name)
    SELECT employee_id, first_name, last_name
    FROM inserted;
END
GO

--Insert into the employee salary table 
INSERT INTO employee_salary(employee_id,first_name,last_name,occupation,salary, dept_id)
VALUES (13,'Jean-Ralphio','Saperstein','Exntertainment 720 CEO', 1000000, NULL);

SELECT*
FROM employee_salary;

SELECT * 
FROM employee_demographics;

--EVENT (takes place when its scheduled)
--DELIMETER $$
--CREATE EVENT delete_retirees ON SCHEDULE EVERY 30 SECOND 
--DO 
--BEGIN 
  -- DELETE
  -- FROM employee_demographics
  -- WHERE age >= 60;
--END $$
--DELIMETER ; I couldnot use this in my sql but i used the delete function 

DELETE FROM employee_demographics WHERE age>= 60;
SELECT * 
FROM employee_demographics;









