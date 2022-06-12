-- Ignacio Podestá
-- SQL Data Analysis Course from Udemy
-- Script file
-- Working with MySQL Workbench

------------------------------
-- CHOSING A DATABASE
------------------------------
USE sakila;
SELECT 42;
SELECT 100;

-- Ctrol + Enter execute
-- Ctrol + Shift + Enter execute all
-- Comenting / uncommenting (Ctrl + /)

-- Example 1
-- Example 2
-- Example 3

/* Example 4
Example 5
*/

-- ORDERING RESULTS
SELECT * 
FROM actor;

-- SELECT STATEMENT
SELECT 42;
SELECT 'Hello World';
SELECT "This text is surrounded by double quotes";
SELECT 42, "Hello";

USE sakila;

SELECT *
FROM actor;

SELECT first_name, actor_id, last_update
FROM actor;

------------------------------
-- COLUMN MANIPULATION
------------------------------
USE world;
SELECT 
Name, IndepYear, 2000- IndepYear, Population, GNP, GNP / Population*1000
FROM country;

-- CONCAT 
SELECT
CONCAT(Name, ' ', HeadOfState)
, Name, HeadOfState, IndepYear
FROM country;

SELECT
CONCAT(HeadOfState, ' is the head of ', Name)
, Name, HeadOfState, IndepYear
FROM country;

SELECT
CONCAT(Name, ' ', IndepYear)
,CONCAT(HeadOfState, ' is the head of ', Name)
, Name, HeadOfState, IndepYear
FROM country;

-- DATE TIME COLUMNS
USE sakila;

SELECT create_date
FROM customer;

------------------------------
-- COLUMN ALIASES
------------------------------
SELECT 
first_name
,last_name AS "Family_Name"
,CONCAT(first_name, ' ', last_name) AS "Full Name" -- Could be with out AS but the name must have no spaces Full_Name
FROM actor;

------------------------------
-- DISTINCT
------------------------------
SELECT last_name
FROM actor;

SELECT DISTINCT last_name
FROM actor;

SELECT DISTINCT first_name, last_name
FROM actor;

------------------------------
-- WHERE
------------------------------
USE world;
SELECT * FROM country
WHERE SurfaceArea > 7000000;

SELECT * FROM country
WHERE IndepYear < 0;

SELECT * FROM country
WHERE continent = "Antarctica";

------------------------------
-- DATETIME VALUES
------------------------------
 -- format 'YYYY-MM-DD hh:mm:ss'
USE sakila;
SELECT rental_id, DATE(rental_date), rental_date, inventory_id
FROM rental;

SELECT *
FROM rental
WHERE DATE(rental_date) = '2005-05-26';

ALTER TABLE rental
ADD COLUMN return_DATEpart DATE AFTER customer_id;

SELECT * 
FROM rental;

SELECT * 
FROM rental
WHERE return_DATEpart = '2005-05-26';

SELECT * FROM city
WHERE city = 'Toronto';

SELECT city_id, city, country_id FROM city
WHERE city_id = 196;

SELECT city, country_id FROM city
WHERE city_id = 196; 

SELECT payment_id, customer_id, amount, amount * 2 AS Db1_Amount
FROM payment
WHERE amount*2 = '1.98'; -- it does not work calling Db1_Amount

------------------------------
-- IN OPERATOR
------------------------------
USE sakila;
-- with int
SELECT * FROM rental
WHERE customer_id IN (318, 281);

-- with strings
SELECT * FROM city
WHERE city IN('London', 'Dallas');

-- dates
SELECT * 
FROM rental
WHERE return_DATEpart IN ('2005-06-15', '2005-07-06');

-- NOT
SELECT * 
FROM rental
WHERE return_DATEpart NOT IN ('2005-06-15', '2005-07-06');

SELECT * 
FROM rental;

------------------------------
-- BETWEEN OPERATOR
------------------------------
SELECT film_id, title, length
FROM film
WHERE length BETWEEN 60 AND 90;

SELECT film_id, title, length FROM film
WHERE title BETWEEN 'A' AND 'D';

SELECT * FROM sakila.rental
WHERE DATE(rental_date) BETWEEN '2005-05-24' AND '2005-05-26';

SELECT film_id, title, length FROM film
WHERE length NOT BETWEEN 60 AND 90;

------------------------------
-- LIKE OPERATOR
------------------------------

USE world;
SELECT Name, Continent, IndepYear, LifeExpectancy
FROM country
WHERE name LIKE 'united%';

SELECT Name, Continent, IndepYear, LifeExpectancy
FROM country
WHERE name LIKE '%m';

SELECT Name, Continent, IndepYear, LifeExpectancy
FROM country
WHERE name LIKE '% the %';

SELECT Name, Continent, IndepYear, LifeExpectancy
FROM country
WHERE name LIKE '_r%'; -- specify place, second

SELECT Name, Continent, IndepYear, LifeExpectancy
FROM country
WHERE name LIKE '__w%';

SELECT Name, Continent, IndepYear, LifeExpectancy
FROM country
WHERE LifeExpectancy LIKE '%.0';

SELECT Name, Continent, IndepYear, LifeExpectancy
FROM country
WHERE Name LIKE '% %';

SELECT Name, Continent, IndepYear, LifeExpectancy
FROM country
WHERE Name NOT LIKE '% %';

------------------------------
-- IS NULL OPERATOR
------------------------------
USE world;
SELECT Name, Continent, IndepYear, LifeExpectancy
FROM country
WHERE IndepYear IS NULL;

SELECT Name, Continent, IndepYear, LifeExpectancy
FROM country
WHERE IndepYear IS NOT NULL;

------------------------------
-- AND & OR OPERATORS
------------------------------
-- AND
USE sakila;
SELECT *
FROM film
WHERE length BETWEEN 60 AND 90
	AND rating = 'G';

SELECT *
FROM film
WHERE length BETWEEN 60 AND 90
	OR rating = 'G';
    
SELECT *
FROM film
WHERE rental_duration = 7 OR 
	rental_duration = 3 AND rating = 'G'; -- AND = multiplication OR = addition

-- WHERE keyword appears only once
-- AND in performed before OR, just like multiplication is perfomre before addition

SELECT order_id
, customer_id
, customer_region
, customer_country
, customer_segment
FROM orders
WHERE customer_segment = "small business" OR 'corporate';

-- task 10 question 3
-- --Write a query to display the order_id, customer_id, customer_region, customer_country, and customer_segment for orders made by:
-- a. customers belong to the 'Small Business' or 'Corporate' customer_segment and:
-- b. customers not living in the ‘North’ or ‘South’ regions

SELECT order_id, customer_id, customer_region, customer_country, customer_segment 
FROM orders
WHERE customer_segment IN ('Small Business','Corporate')
AND   customer_region NOT IN ('North', 'South')

-- task 10 question 4
-- Write a query to display the order_id, discount, unit_price, profit and discount for all orders with profit in the range of 100-200 and discount not in the range of 0.1-0.5
SELECT order_id, discount, unit_price, profit, discount 
FROM orders 
WHERE profit BETWEEN 100 AND 200 AND discount NOT BETWEEN 0.1 AND 0.5;

------------------------------
-- MODULUS & INTEGER DIVISION
------------------------------

SELECT 20/4;
SELECT 20/3;
SELECT 20 % 6;
SELECT 20 % 6;
SELECT 20 MOD 6;

USE sakila;
SELECT 
film_id, title, rental_duration, rental_rate, length, rating, special_features
FROM film
WHERE rental_duration %2 = 1;

-- Integer Division
SELECT 20 DIV 4;
SELECT 20 DIV 5;
SELECT 20 DIV 6;

USE world;
SELECT Name, Continent, IndepYear
FROM country
-- WHERE indepyear BETWEEN 1100 AND 1199
-- 	OR indepyear BETWEEN 1400 AND 1499
--     OR indepyear BETWEEN 1700 AND 1799;a
WHERE indepyear DIV 100 IN (11,14,17);

------------------------------
-- ORDER BY
------------------------------
-- 1. Sort the results in asc or desc order
USE world;
SELECT Name, Region, IndepYear, LifeExpectancy
FROM country
ORDER BY Region DESC; -- ASC is default

-- 2. Sort by manipulated columns/aliases
SELECT Name, Region, IndepYear, LifeExpectancy * 2 AS Double_Life
FROM country
ORDER BY Double_Life * 2 DESC;

-- 3. Sort by multiple colums
SELECT Name, Region, IndepYear, LifeExpectancy
FROM country
ORDER BY Region, Name DESC;

-- 4. Nulls
SELECT Name, Region, IndepYear, LifeExpectancy
FROM country
ORDER BY IndepYear DESC;

-- Exercise 11
-- 1. Write a query to display the order_id, discount, unit_price, and profit.
-- a. Restrict the results to display only orders with profit > 100
-- b. Sort the output by discount in a descending order

SELECT order_id, discount, unit_price, profit
FROM orders
WHERE orders > 100
ORDER BY discount DESC;

-- 2. Write a query to display the order_id, discount, unit_price, and profit.
-- a. Restrict the results to display only orders with profit > 100
-- b. Sort the output by discount in a descending order, and then by profit in an ascending order
SELECT order_id, discount, unit_price, profit
FROM orders
WHERE profit > 100
ORDER BY discount DESC, profit; 

------------------------------
-- LIMIT
------------------------------
USE world;
SELECT *
FROM country
LIMIT 5;

-- Top N analysis
SELECT *
FROM country
ORDER BY SurfaceArea DESC
LIMIT 6;

-- Exercise 12
-- 1.Write a query to display the row_id, order_priority, unit_price, shipping_cost and customer_name
-- a. Sort the output by shipping_cost
-- b. Limit your output to the first 5 rows

SELECT row_id, order_priority, unit_price, shipping_cost, customer_name
FROM orders 
ORDER BY shipping_cost
LIMIT 5;

-- 2. Write a query to display the row_id, order_priority, unit_price, shipping_cost and profit
-- a. Sort the output by profit (ascending)
-- b. Limit your output to the first 3 rows
SELECT row_id, order_priority, unit_price, shipping_cost, profit
FROM orders
ORDER BY profit
LIMIT 3;

------------------------------
------------------------------
-- Netflix Data Analysis
------------------------------
------------------------------
-- 1. [movies] Write a query to display the title, rating, country, release_year, and director, for all movies directed by Michael Bay.
-- Sort the output by release_year (ascending)
SELECT title, rating, country, realese_year, director
FROM movies
WHERE director = 'Michael Bay'
ORDER BY release_year;

-- 2. [movies] Write a query to display the title, country, duration_in_minutes, and date_added, for all movies that were added before March 2011. Sort the output by duration_in_minutes (ascending)
SELECT title, country, duration_in_minutes, date_added
FROM movies
WHERE date_added < '2001-03-01'
ORDER BY duration_in_minutes; 

-- 3 [movies] Write a query to display the title, country, duration_in_minutes, and release_year, for all movies that were released between 2014 and 2016.
-- Sort the output by duration_in_minutes (descending)
SELECT title, country, duration_in_minutes, release_year
FROM movies
WHERE realease_year BETWEEN 2014 AND 2016
ORDER BY duration_in_minutes DESC;

-- 4.[movies] Write a query to display the title, director, country, and duration_in_minutes,
-- for all movies with duration between 3-4 hours. Sort the output by duration_in_minutes (descending)
SELECT title, director, country, duration_in_minutes * 60 AS duration_in_hours
FROM movies
WHERE duration_in_minutes/60 BETWEEN 3 AND 4
ORDER BY duration_in_hours DESC;

-- 5. [series] Write a query to display the title, director, rating, num_of_seasons for all series with 10 to 14 seasons.
-- Sort the output by num_of_seasons (descending)
SELECT title, director, rating, num_of_seasons
FROM series
WHERE num_of_seasons BETWEEN 10 AND 14
ORDER BY num_of_seasons DESC;

-- 6. [series] Write a query to display the title, director, rating, num_of_seasons
-- for all series
-- a. containing value in the director column (diretor not equals null)
-- b. and having num_of_seasons > 7
SELECT title, director, rating, num_of_seasons
FROM series
WHERE director IS NOT NULL AND num_of_season > 7;

-- 7. [movies] Write a query to display the title, director, cast, country and rating, for all movies having Ryan Reynolds in their cast
SELECT title, director, cast, country, rating
FROM movies
WHERE cast LIKE 'Ryan Reynolds%';

-- 8. [movies] Write a query to display the title, director, cast, country and rating, for all movies having Ryan Reynolds and Nicolas Cage in their cast
SELECT title, director, cast, country, rating
FROM movies
WHERE cast LIKE '%Ryan Reynolds%' AND cast LIKE '%Nicolas Cage%';

-- 9. [movies] Write a query to display the title, director, cast, country, duration_in_minutes, and rating
-- a. for all movies having PG (Parental Guidance) in their rating
-- b. and movie duration is greater than 3 hours
SELECT title, director, cast, country, duration_in_minutes, rating
FROM movies
WHERE rating LIKE '%PG%' AND duration_in_minutes > 180;

-- 10.[series] Write a query to display title, director, cast, country, and release_year for all series released in 2014, 2016, or 2018. Sort the output by title (ascending)
SELECT title, director, cast, country, release_year
FROM series
WHERE release_year IN(2014,2016,2018) 
ORDER BY title;

------------------------------
-- SCALAR FUNCTIONS
------------------------------
SELECT 'Paradise Falls';
SELECT UPPER('Paradise Falls');

USE sakila;
SELECT title, LOWER(title)
FROM film;

SELECT UPPER('Paradise Falls'); -- ANSI;
SELECT UCASE('Dug'); -- non ANSI

------------------------------
-- STRING FUNCTIONS
------------------------------
-- 1. LEFT
SELECT LEFT('Hello', 3);

-- 2. RIGH
SELECT RIGHT('Hello', 3);

-- 3. LEN
SELECT LENGTH('Hello');

-- 4. REPLACE
SELECT REPLACE('Hello World', 'l', '*');
SELECT REPLACE('Hello World', 'll', '*');
SELECT REPLACE('Hello World', 'l', '');

-- In MySQL REPLACE function is case sensitive
SELECT REPLACE('Hello World', 'o', '*');
SELECT REPLACE('Hello World', 'O', '*');

-- Use REPLACE to amend a "stringed number", into a number.
SELECT REPLACE('67k', 'k', '000');
SELECT REPLACE('5.000', '.', '');

-- 5. REVERSE
SELECT REVERSE('Hello World');

-- 6. SUBSTRING
SELECT SUBSTRING('Hello World', '3', '5');

-- 7. POSITION
SELECT POSITION('o' IN 'Hello World');

-- 8. LOWER
SELECT LOWER('Hello World');

-- 9. UPPER
SELECT UPPER('Hello');

-- 10. NESTING 2 FUNCTIONS
SELECT CONCAT(SUBSTRING('John', 1, 3), SUBSTRING('Doe', 1, 2), '@gmail.com');

-- 11. NESTION 3 FUNC. 
SELECT UPPER(CONCAT(SUBSTRING('John', 1, 3), SUBSTRING('Doe', 1, 2), '@gmail.com'));

-- 12. CUSTOMER DEMO
USE sakila;
SELECT
REPLACE(first_name, 'A', '-')
, REVERSE(last_name)
, LOWER(CONCAT(SUBSTRING(first_name, 1, 2), SUBSTRING(last_name, 1,2), '@gmail.com')) AS 'new_email'
FROM CUSTOMER
WHERE LENGTH(first_name) = 5
OR POSITION('a' IN first_name) = 2;

-- 1 Display the id, first name in lowercase and last name in uppercase, for all employees whose employee number is in the range between 80 and 150.
SELECT id
, LOWER(first_name)
, UPPER(last_name)
FROM employees
WHERE id BETWEEN 80 AND 150;

-- 2. For each employee, display the:
-- a. first name
-- b. last name
-- c. email address - The email address will be composed of the first letter of first name, concatenated with the three first letters of last name, concatenated with @gmail.com.
SELECT 
first_name
, last_name
, CONCAT(SUBSTRING(first_name, 1,1 ), SUBSTRING(last_name,1,3), '@gmail.com')
FROM employees;

-- 3. Repeat the last query, only this time present the values of Email in lowercase
SELECT 
first_name
, last_name
, LOWER(CONCAT(SUBSTRING(first_name, 1,1 ), SUBSTRING(last_name,1,3), '@gmail.com'))
FROM employees;

-- 4.Write a query to display the id, first_name, last_name and phone_number.
-- In each phone_number replace all dashes ('-') with dots ('.')
SELECT id
, first_name
, last_name
, REPLACE(phone_number, '-', '.') AS 'new_phone_number'
FROM employees;

-- 5. Write a query to display the id, first_name, last_name, job_title, department_id
-- for employees with length of job_title greater than 35 characters
SELECT id
, first_name
, last_name
, job_title
, department_id
FROM employees
WHERE LENGTH(job_title) > 35;

------------------------------
-- NUMERIC FUNCTIONS
------------------------------
SELECT ROUND(7.4);
SELECT ROUND(7.684, 2);
SELECT ROUND(7.688, 2);

SELECT CEIL(7.0001); -- Always round up

SELECT FLOOR(7.4); -- Always round down

SELECT PI();

SELECT ABS(100), ABS(-200);

SELECT POW(4,3); -- 4 ** 3

SELECT SQRT(64);

-- For each employee, display :
-- a. first_name
-- b. salary
-- c. salary after a raise of 12% (salary * 1.12)
-- d. salary after a raise of 12%, expressed as a whole number (ROUND)
-- e. salary after a raise of 12%, rounded down to the nearest whole number

SELECT 
first_name
, salary
, salary * 1.12 AS 'new_salary'
, ROUND(salary * 1.12, 0) AS 'new_salary_round'
, FLOOR(salary * 1.12) AS 'new_salary_floor'
FROM employees;

------------------------------
-- 30. DATETIME FUNCTIONS
------------------------------
-- 1. DATETIME / TIMESTAMP FORMAT
-- YYYY-MM-DD hh:mm:ss.microsendos(6 digits)
-- example '2022-06-09 17:06:00.123456'

-- 2. CURRENT
SELECT CURRENT_TIMESTAMP();
SELECT CURDATE();
SELECT CURTIME();

-- 3. ADDITION SUBSTRACTION
SELECT DATE_ADD('2022-01-01 10:35:00', INTERVAL 1 DAY); -- ADDING ONE DAY

SELECT DATE_ADD('2022-01-01 10:35:00', INTERVAL 1 MONTH);
-- DO NOT USE "DAYS"

SELECT DATE_ADD('1986-02-07 10:35:00', INTERVAL 36 YEAR);

SELECT DATE_ADD('2022-01-01 10:35:00', INTERVAL 2 HOUR);

SELECT DATE_ADD('2022-01-01 10:35:00', INTERVAL -4 YEAR);

SELECT '1903-12-17' - INTERVAL '5' YEAR + INTERVAL '1' MONTH;

-- 4. CALCULATIN DIFFERENCES
SELECT TIMESTAMPDIFF(YEAR, '1903-12-17', CURRENT_TIMESTAMP);
-- WEEK
SELECT TIMESTAMPDIFF(WEEK, CURRENT_TIMESTAMP, '2021-03-01');
-- DAY
SELECT TIMESTAMPDIFF(DAY, '2021-03-01', CURRENT_TIMESTAMP);
-- HOUR
SELECT TIMESTAMPDIFF(HOUR, '2021-02-02 15:00:00', '2021-02-01 15:00:00');

-- 5. EXTRACTING 
SELECT EXTRACT(MINUTE FROM '1903-12-17 10:35:00');
SELECT DATE('1986-2-7 10:35:00');
SELECT TIME('1986-2-7 10:35:00');
SELECT YEAR('1986-2-7 10:35:00');
SELECT MICROSECOND('1986-2-7 10:35:00.123456');
SELECT 18/MONTH('1986-2-7 10:35:00');
SELECT MONTHNAME('1986-2-7 10:35:00');
SELECT DAYNAME('1986-2-7 10:35:00');
SELECT QUARTER('1986-2-7 10:35:00');

-- Filtering using extracted data part. 
USE sakila;
SELECT rental_id, rental_date, inventory_id, customer_id
FROM rental
-- WHERE MONTH(rental_date) = 6;
WHERE YEAR(rental_date) = 2005 AND MONTH(rental_Date) = 6;

SELECT DATE_SUB('1986-2-7', INTERVAL 2 HOUR);

SELECT MONTH('1986-2-7 10:25:00');
SELECT MONTHNAME('1986-2-7');

-- 1. Write a query to display:
-- a. first_name
-- b. hire_date
-- c. hire_date plus 10 days
-- d. hire_date plus 1 month
-- e. Difference in days between current date and hire_date
SELECT first_name
, hire_date
, DATE_ADD(hire_Date, INTERVAL 10 DAY) AS 'hire_date_10_days'
, DATE_ADD(hire_date, INTERVAL 1 MONTH) AS 'hire_Date_1_month'
, TIMESTAMPDIFF(DAY, hire_date, CURRENT_DATE) 
FROM employees;

-- 2. Write a query to display the first_name, last_name, birth_date, and age for each employee
SELECT first_name
, last_name
, birth_date
, TIMESTAMPDIFF(YEAR, birth_date, CURRENT_DATE) AS 'Age';

-- 3. Write a query to display the first_name, last_name, and birth_date for employees who were born on the same day and month as today.
-- For example: if today is 2021-02-15, we are looking for all employees born on February 15th, regardless the year
-- Note - depends on the current date, this query may or may not return any results.
SELECT first_name, last_name, birth_date
FROM   employees 
WHERE  DAY(birth_date) =   DAY(CURRENT_DATE)
AND    MONTH(birth_date) = MONTH(CURRENT_DATE);

------------------------------
-- 31. NULL handeling
------------------------------

SELECT IFNULL(16, "Hello World");
SELECT IFNULL('Bye', "Hello World");
SELECT IFNULL(NULL, "Nothing here");
SELECT IFNULL(0, "Nothing here");
SELECT IFNULL('', "Nothing here");

USE world;
SELECT name
, LifeExpectancy
, IFNULL(LifeExpectancy, 120)
FROM country;

-- IS NULL it is an operator
-- IFNULL it is a function