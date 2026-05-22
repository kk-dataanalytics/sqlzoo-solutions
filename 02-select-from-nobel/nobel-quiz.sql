-- SQLZoo: SELECT from Nobel Quiz
-- Link: https://sqlzoo.net/wiki/Nobel_Quiz
-- Description: My answers to the SELECT from Nobel multiple choice quiz

-- -------------------------------------------------------
-- Q1: Pick the code which shows the name of winners beginning with C and ending in n

SELECT winner FROM nobel
WHERE winner LIKE 'C%' AND winner LIKE '%n';

-- -------------------------------------------------------
-- Q2: Select the code that shows how many Chemistry awards were given between 1950 and 1960

SELECT COUNT(subject) FROM nobel
WHERE subject = 'Chemistry'
AND yr BETWEEN 1950 AND 1960;

-- -------------------------------------------------------
-- Q3: Pick the code that shows the amount of years where no Medicine awards were given

SELECT COUNT(DISTINCT yr) FROM nobel
WHERE yr NOT IN (SELECT DISTINCT yr FROM nobel WHERE subject = 'Medicine');

-- -------------------------------------------------------
-- Q4: Select the result that would be obtained from the following code:
-- SELECT subject, winner FROM nobel WHERE winner LIKE 'Sir%' AND yr LIKE '196%'
-- Answer: Medicine | Sir John Eccles / Medicine | Sir Frank Macfarlane Burnet

-- -------------------------------------------------------
-- Q5: Select the code which would show the year when neither a Physics or Chemistry award was given

SELECT yr FROM nobel
WHERE yr NOT IN (SELECT yr FROM nobel
                 WHERE subject IN ('Chemistry', 'Physics'));

-- -------------------------------------------------------
-- Q6: Select the code which shows the years when a Medicine award was given but no Peace or Literature award was given

SELECT DISTINCT yr
FROM nobel
WHERE subject = 'Medicine'
AND yr NOT IN (SELECT yr FROM nobel WHERE subject = 'Literature')
AND yr NOT IN (SELECT yr FROM nobel WHERE subject = 'Peace');

-- -------------------------------------------------------
-- Q7: Pick the result that would be obtained from the following code:
-- SELECT subject, COUNT(subject) FROM nobel WHERE yr = '1960' GROUP BY subject
-- Answer: Chemistry 1 | Literature 1 | Medicine 2 | Peace 1 | Physics 1
