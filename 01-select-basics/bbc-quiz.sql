-- SQLZoo: BBC Quiz
-- Link: https://sqlzoo.net/wiki/BBC_QUIZ
-- Description: My answers to the BBC Quiz

-- -------------------------------------------------------
-- Q1: Select the code which gives the name of countries beginning with U

-- Answer:
SELECT name
FROM world
WHERE name LIKE 'U%';

-- -------------------------------------------------------
-- Q2: Select the code which shows just the population of United Kingdom

-- Answer:
SELECT population
FROM world
WHERE name = 'United Kingdom';

-- -------------------------------------------------------
-- Q3: Select the answer which shows the problem with this SQL code
-- SELECT continent FROM world WHERE 'name' = 'France'

-- Answer: 'name' should be name
-- (Column names should not be in quotes)

-- -------------------------------------------------------
-- Q4: Select the result that would be obtained from the following code:
-- SELECT name, population / 10 FROM world WHERE population < 10000

-- Answer:
-- name  | population / 10
-- Nauru | 990

-- -------------------------------------------------------
-- Q5: Select the code which would reveal the name and population
-- of countries in Europe and Asia

-- Answer:
SELECT name, population
FROM world
WHERE continent IN ('Europe', 'Asia');

-- -------------------------------------------------------
-- Q6: Select the code which would give two rows

-- Answer:
SELECT name FROM world
WHERE name IN ('Cuba', 'Togo');

-- -------------------------------------------------------
-- Q7: Select the result that would be obtained from this code:
-- SELECT name FROM world WHERE continent = 'South America'
-- AND population > 40000000

-- Answer:
-- name
-- Brazil
-- Colombia
