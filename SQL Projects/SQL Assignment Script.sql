
-- Create Database named 'world'
CREATE DATABASE world

USE WORLD;

-- Task 1
-- Create a Table named language from Distinct column 'Language' in table countrylanguage 
SELECT DISTINCT countrylanguage.Language AS 'LanguageName'
INTO language
FROM countrylanguage

ALTER TABLE language
ADD PRIMARY KEY (LanguageName)

-- Set Foreign Keys for tables
ALTER TABLE countrylanguage
ADD FOREIGN KEY (Language)
REFERENCES language (LanguageName)

ALTER TABLE countrylanguage
ADD FOREIGN KEY (CountryCode)
REFERENCES country (Code)

ALTER TABLE city
ADD FOREIGN KEY (CountryCode)
REFERENCES country (Code)

-- Task 2
SELECT country.Name AS 'Country Name', 
	   COUNT(city.name) AS 'Number of Cities'
FROM country 
JOIN city ON country.Code = city.CountryCode
WHERE country.Code = 'USA'
GROUP BY country.Name

-- Task 3
SELECT country.Name AS 'Country Name', 
	FORMAT (country.Population,'#,###,###,###,###') AS 'Population', 
	country.LifeExpectancy AS 'Average Life Expectancy'
FROM country
WHERE country.Code = 'ARG'

-- Task 4
SELECT TOP 1 country.Name AS 'Country Name', 
	country.Continent,
	FORMAT (country.Population,'#,###,###,###,###') AS 'Population',
	country.LifeExpectancy AS 'Average Life Expectancy'
FROM country
ORDER BY country.LifeExpectancy DESC

-- Task 5  
SELECT TOP 25 city.Name AS 'City Name', 
	country.Name AS 'Country Name',
	FORMAT (city.Population,'#,###,###,###,###') AS 'City Population'
FROM city
JOIN country ON city.CountryCode = country.Code
WHERE city.Name LIKE 'F%'
ORDER BY city.Name

-- Task 6
SELECT TOP 10 city.ID AS 'City ID',
	city.Name AS 'City Name', 
	FORMAT (city.Population,'#,###,###,###,###') AS 'City Population'
FROM city
ORDER BY city.Name

-- Task 7
SELECT city.Name AS 'City Name',
	country.Name AS 'Country Name',
	FORMAT (city.Population,'#,###,###,###,###') AS 'City Population'
FROM city
JOIN country ON country.Code = city.CountryCode
WHERE city.Population > 2000000
ORDER BY city.Population DESC

-- Task 8
SELECT city.Name AS 'City Name', 
		country.Name AS 'Country Name',
		FORMAT (city.Population,'#,###,###,###,###') AS 'City Population'
FROM city
JOIN country ON city.CountryCode = country.Code
WHERE city.Name LIKE 'BE%'
ORDER BY city.Name

-- Task 9
SELECT city.Name AS 'City Name',
	country.Name AS 'Country Name',
	FORMAT (city.Population,'#,###,###,###,###') AS 'City Population'
FROM city
JOIN country ON country.Code = city.CountryCode
WHERE city.Population between 500000 and 1000000
ORDER BY city.Population DESC

-- Task 10
SELECT country.Name AS 'Country Name',
	city.Name AS 'Country Capital'
FROM city
LEFT JOIN country ON city.CountryCode = country.Code
WHERE country.Code = 'ESP' AND city.ID=country.Capital

-- Task 11
SELECT DISTINCT countrylanguage.Language AS 'Language',
	COUNTRY.Region
FROM country
LEFT JOIN countrylanguage ON countrylanguage.CountryCode = country.Code
WHERE country.Region = 'Southeast Asia'
ORDER BY countrylanguage.Language

-- Task 12
SELECT TOP 1 city.Name AS 'City Name',
	country.Name AS 'Country Name',
	FORMAT (city.Population,'#,###,###,###,###') AS 'City Population'
FROM city
JOIN country ON country.Code = city.CountryCode
ORDER BY city.Population

