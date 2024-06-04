/*Creating table 1*/
Create Table EmployeeDemographics 
(EmployeeID int, 
FirstName varchar(50), 
LastName varchar(50), 
Age int, 
Gender varchar(50)
)

/*Creating table 2*/
Create Table EmployeeSalary 
(EmployeeID int, 
JobTitle varchar(50), 
Salary int
)

/*Insert into table one */
Insert into EmployeeDemographics VALUES
(1001, 'Jim', 'Halpert', 30, 'Male'),
(1002, 'Pam', 'Beasley', 30, 'Female'),
(1003, 'Dwight', 'Schrute', 29, 'Male'),
(1004, 'Angela', 'Martin', 31, 'Female'),
(1005, 'Toby', 'Flenderson', 32, 'Male'),
(1006, 'Michael', 'Scott', 35, 'Male'),
(1007, 'Meredith', 'Palmer', 32, 'Female'),
(1008, 'Stanley', 'Hudson', 38, 'Male'),
(1009, 'Kevin', 'Malone', 31, 'Male')
/**/
INSERT Into  EmployeeDemographics VALUES
(1011, 'Ryan', 'Howard', 26, 'Male'),
(NULL, 'Holly', 'Flex', NULL, 'NULL'),
(1013, 'Darryl', 'Philbin', NULL, 'Male')

/* Insert into table 2*/
Insert Into EmployeeSalary VALUES
(1001, 'Salesman', 45000),
(1002, 'Receptionist', 36000),
(1003, 'Salesman', 63000),
(1004, 'Accountant', 47000),
(1005, 'HR', 50000),
(1006, 'Regional Manager', 65000),
(1007, 'Supplier Relations', 41000),
(1008, 'Salesman', 48000),
(1009, 'Accountant', 42000)
Insert into EmployeeSalary VALUES
(1010, 'NULL', 47000),
(NULL, 'Salesman', 43000)



/* The star selects all the rows*/
SELECT *
FROM EmployeeDemographics

/* Select the first and last name */
SELECT FirstName , LastName
FROM EmployeeDemographics

/*Select the first top 5 rows*/
SELECT TOP 5*
FROM EmployeeDemographics

/*This specifies the id column */
SELECT DISTINCT (EmployeeID)
FROM EmployeeDemographics

/*This specifies the nan values in a column */
SELECT COUNT (LastName) AS LastNameCount
FROM EmployeeDemographics

/*Find the maximum salary in the employee salary table */
SELECT MAX(Salary) 
FROM EmployeeSalary

/*Find the minimum salary in the employee salary table */
SELECT MIN(Salary) 
FROM EmployeeSalary

/*Find the average salary in the employee salary table */
SELECT AVG(Salary) 
FROM EmployeeSalary

/*WHERE STATEMENTS*/

/*WHERE FIRSTNAME IS JIM*/
SELECT *
FROM EmployeeDemographics
WHERE FirstName = 'Jim'

/*Where gender is not equal to female*/
SELECT *
FROM EmployeeDemographics
WHERE Gender != 'Female'

/*WHERE FIRSTNAME IS Not JIM*/
SELECT *
FROM EmployeeDemographics
WHERE FirstName <> 'Jim'

/*WHERE Age is greater than 30*/
SELECT *
FROM EmployeeDemographics
WHERE Age > 30

/*WHERE Age is less than 32*/
SELECT*
FROM EmployeeDemographics
WHERE Age < 32

/*AND OR NOT LOGICAL OPERATORS*/
/*Less than or equal to 32 and gender male*/
SELECT*
FROM EmployeeDemographics
WHERE Age <= 32 AND Gender = 'Male'

SELECT*
FROM EmployeeDemographics
 WHERE ( FirstName = 'Pam' AND Age =30 ) OR Age > 35

SELECT *
FROM EmployeeDemographics
WHERE Age <30 
OR Gender = 'Female'

/*LIKE STATEMENTS*/
/*Select last names that begin with S*/
SELECT*
FROM EmployeeDemographics
WHERE LastName LIKE 'S%'

/*Select names where theres an  S using the wild card   %--ANYTHING _*/
SELECT*  
FROM EmployeeDemographics
WHERE LastName LIKE '%S%'

SELECT*
FROM EmployeeDemographics
WHERE LastName LIKE 'S%ott%'

/*THE UNDERSCORE FUNCTION*/
SELECT *
FROM EmployeeDemographics
WHERE FirstName LIKE 'J__'

/*NULL STATEMENTS */
SELECT*
FROM EmployeeDemographics
WHERE FirstName is NULL

/* NOT NULL*/
SELECT *
FROM EmployeeDemographics
WHERE FirstName is NOT NULL

/*IN STATEMENTS*/

SELECT *
FROM EmployeeDemographics
WHERE FirstName IN ('Jim', 'Michael')

/*GROUP BY , ORDER BY */
/*This will group the two genders */
SELECT Gender
FROM EmployeeDemographics
GROUP BY Gender

/*This will group the two genders and return the number of each */
SELECT Gender, COUNT (Gender)
FROM EmployeeDemographics
GROUP BY Gender

/*Count of Gender */
SELECT Gender, Age, COUNT (Gender)
FROM EmployeeDemographics
GROUP BY Gender, Age

/*Count of the age >31 */
SELECT Gender, COUNT (Gender)
FROM EmployeeDemographics
WHERE Age > 31
GROUP BY Gender

SELECT Gender, COUNT (Gender) AS CountGender 
FROM EmployeeDemographics
WHERE Age > 31
GROUP BY Gender
ORDER BY CountGender 

/*DESC AND ASC ORDER*/
SELECT*
FROM EmployeeDemographics
ORDER BY Age DESC, Gender DESC

/*INER JOINS, FULL/LEFT/RIGHT OUTER JOINS*/

SELECT *
FROM [SQL Tutorial].dbo.EmployeeDemographics

SELECT * 
FROM [SQL Tutorial]	.dbo.EmployeeSalary

/*JOIN BOTH TABLES (TABLES THAT HAVE SOMETHING IN COMMON  IN BOTH TABLES */
SELECT *
FROM [SQL Tutorial].dbo.EmployeeDemographics
INNER JOIN [SQL Tutorial].dbo.EmployeeSalary
    ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


/*FULL OUTER JOIN*/
SELECT*
FROM [SQL Tutorial].dbo.EmployeeDemographics
FULL OUTER JOIN [SQL Tutorial].dbo.EmployeeSalary
 ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


 /*LEFT OUTER JOIN*/
SELECT*
FROM [SQL Tutorial].dbo.EmployeeDemographics
LEFT OUTER JOIN [SQL Tutorial].dbo.EmployeeSalary
 ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


 /*RIGHT OUTER JOIN*/
SELECT*
FROM [SQL Tutorial].dbo.EmployeeDemographics
RIGHT OUTER JOIN [SQL Tutorial].dbo.EmployeeSalary
 ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


 SELECT EmployeeDemographics.EmployeeID,FirstName, LastName, JobTitle, Salary
 FROM [SQL Tutorial].dbo.EmployeeDemographics
 INNER JOIN [SQL Tutorial].dbo.EmployeeSalary 
 ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

--GROUP BY STATEMENTS 
SELECT *
FROM employee_demographics

--Group by gender
SELECT gender
FROM employee_demographics
GROUP BY gender 
;

--Aggregate function with Gender 
SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender
;

--Group from the salary table based on occupation and salary 
SELECT occupation, salary 
FROM employee_salary
GROUP BY occupation, salary
;

--The highest and lowest  age in both genders and count of genders 
SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender
;

--ORDER BY STATEMENTS
--Order by firstname(This will order the names in ASC order from A-Z)
SELECT *
FROM employee_demographics
ORDER BY first_name

--Order by firstname in descending order 
SELECT *
FROM employee_demographics
ORDER BY first_name DESC;

--Order by gender and age 
SELECT *
FROM employee_demographics
ORDER BY gender, age 
;








































