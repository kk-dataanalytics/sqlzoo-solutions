-- SQLZoo: SELECT from WORLD Tutorial
-- Link: https://sqlzoo.net/wiki/SELECT_from_WORLD_Tutorial
-- Description: My solutions to the SELECT from WORLD tutorial exercises
-- Note: Q1 was an introductory observation exercise with no solution required.

-- -------------------------------------------------------
-- Q2: Large Countries
-- Show the name for the countries that have a population
-- of at least 200 million.

SELECT name
FROM world
WHERE population >= 200000000;

-- -------------------------------------------------------
-- Q3: Per Capita GDP
-- Give the name and per capita GDP for those countries
-- with a population of at least 200 million.

SELECT name, gdp/population AS gdp
FROM world
WHERE population >= 200000000;

-- -------------------------------------------------------
-- Q4: South America In Millions
-- Show the name and population in millions for the
-- countries of continent 'South America'.

SELECT name, population/1000000
FROM world
WHERE continent = 'South America';

-- -------------------------------------------------------
-- Q5: France, Germany, Italy
-- Show the name and population for France, Germany, Italy.

SELECT name, population
FROM world
WHERE name IN ('France', 'Germany', 'Italy');

-- -------------------------------------------------------
-- Q6: United
-- Show the countries which have a name that includes the
-- word 'United'.

SELECT name
FROM world
WHERE name LIKE '%United%';

-- -------------------------------------------------------
-- Q7: Two Ways To Be Big
-- Show the countries that are big by area (more than 3 million)
-- or big by population (more than 250 million).
-- Show name, population and area.

SELECT name, population, area
FROM world
WHERE area > 3000000 OR population > 250000000;

-- -------------------------------------------------------
-- Q8: One or the Other (but not both)
-- Show the countries that are big by area or big by
-- population but not both. Show name, population and area.

SELECT name, population, area
FROM world
WHERE (area > 3000000 AND population <= 250000000)
OR (area <= 3000000 AND population > 250000000);

-- -------------------------------------------------------
-- Q9: Rounding
-- Show the name and population in millions and GDP in billions
-- for South America countries, rounded to 2 decimal places.

SELECT name, ROUND(population/1000000, 2), ROUND(gdp/1000000000, 2)
FROM world
WHERE continent = 'South America';

-- -------------------------------------------------------
-- Q10: Trillion Dollar Economies
-- Show the name and per-capita GDP for countries with a GDP
-- of at least one trillion. Round to the nearest 1000.

SELECT name, ROUND(gdp/population, -3) AS gdp
FROM world
WHERE gdp >= 1000000000000;

-- -------------------------------------------------------
-- Q11: Name and Capital Have the Same Length
-- Show the name and capital where the name and capital have
-- the same number of characters.

SELECT name, capital
FROM world
WHERE length(name) = length(capital);

-- -------------------------------------------------------
-- Q12: Matching Name and Capital
-- Show the name and capital where the first letters of each
-- match. Don't include countries where name and capital
-- are the same word.

SELECT name, capital
FROM world
WHERE LEFT(name, 1) = LEFT(capital, 1)
AND name <> capital;

-- -------------------------------------------------------
-- Q13: All the Vowels
-- Find the country that has all the vowels (a e i o u)
-- and no spaces in its name.

SELECT name
FROM world
WHERE name LIKE '%a%'
AND name LIKE '%e%'
AND name LIKE '%i%'
AND name LIKE '%o%'
AND name LIKE '%u%'
AND name NOT LIKE '% %';
