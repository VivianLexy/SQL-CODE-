
--STRING FUNCTIONS 
--Length functions 
SELECT LEN('skyfall')

--Length of the firstnames
SELECT first_name, LEN(first_name)
FROM employee_demographics;

--Usin upper and lower cases 
SELECT UPPER ('sky')
SELECT LOWER ('sky')--will give us lower cases 

--Select the firstnames using upper cases 
SELECT first_name, UPPER(first_name)
FROM employee_demographics;

--TRIM 
--Removes leading and trailing spaces from a string.
SELECT TRIM('     sky      ');

--Left trim(Removes the space on the left)
SELECT LTRIM('     sky      ');

-- Right trim(Removes the space on the right)
SELECT RTRIM('     sky      ');

--Select the firstnames from the left and right 
SELECT first_name, 
LEFT (first_name, 4),
RIGHT(first_name, 4)
FROM employee_demographics;

--SUBSTRINGS 
--A substring extracts some characters from a string 
SELECT first_name,
LEFT (first_name, 4),
RIGHT (first_name, 4),
SUBSTRING(first_name, 3,2)
FROM employee_demographics;

--A substring extracts some characters from a string
--Extract the firstname and birthmonth
--LEFT(first_name, 4) extracts the first 4 characters from the first_name.
--RIGHT(first_name, 4) extracts the last 4 characters from the first_name.
--SUBSTRING(first_name, 3, 2) extracts the 3rd and 4th characters from the first_name.
--SUBSTRING(CONVERT(varchar, birth_date, 112), 5, 2) first converts the birth_date to a string in the YYYYMMDD format using CONVERT(varchar, birth_date, 112), and then extracts the month part using SUBSTRING.
SELECT first_name,
LEFT(first_name, 4) AS first_name_first_4_chars,
RIGHT(first_name, 4) AS first_name_last_4_chars,
SUBSTRING(first_name, 3, 2) AS first_name_3rd_4th_chars,
birth_date,
SUBSTRING(CONVERT(varchar, birth_date, 112), 5, 2) AS birth_month
FROM employee_demographics;


--REPLACE 
--Replace every occurrence of the character 'a' with the character 'z' in the first_name column  
SELECT first_name, REPLACE(first_name, 'a','z')
FROM employee_demographics;

--LOCATE 
--This function searches for the substring 'AN' within the first_name column and returns
--the starting position of the first occurrence. If 'AN' is not found, it returns 0.
SELECT first_name, 
CHARINDEX('AN', first_name) AS position_of_AN
FROM employee_demographics;

--CONCAT 
--Combine the firstname and lastname columns 
SELECT first_name, last_name,
CONCAT(first_name, ' ', last_name) AS full_name
FROM employee_demographics;









