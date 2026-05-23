-- SQL Practice: Nobel Prize Subquery Exercises
-- Description: Extra practice questions using subqueries and GROUP BY
-- Note: These questions were completed outside of SQLZoo for additional practice

-- -------------------------------------------------------
-- Q1: Show all years where a Physics prize was given but no Chemistry prize was given

SELECT yr FROM nobel
WHERE subject = 'Physics'
AND yr NOT IN (SELECT yr FROM nobel WHERE subject = 'Chemistry');

-- -------------------------------------------------------
-- Q2: Show the names of winners who won in the same year as Albert Einstein

SELECT winner FROM nobel
WHERE yr IN (SELECT yr FROM nobel WHERE winner = 'Albert Einstein')
AND winner <> 'Albert Einstein';

-- -------------------------------------------------------
-- Q3: Count how many years had no Literature award given

SELECT COUNT(DISTINCT yr) FROM nobel
WHERE yr NOT IN (SELECT DISTINCT yr FROM nobel WHERE subject = 'Literature');

-- -------------------------------------------------------
-- Q4: Show all years where both a Peace AND a Medicine award was given

SELECT DISTINCT yr FROM nobel
WHERE yr IN (SELECT yr FROM nobel WHERE subject = 'Peace')
AND yr IN (SELECT yr FROM nobel WHERE subject = 'Medicine');

-- -------------------------------------------------------
-- Q5: Show the names of all Medicine winners who won in a year where no Physics award was given

SELECT winner FROM nobel
WHERE subject = 'Medicine'
AND yr NOT IN (SELECT yr FROM nobel WHERE subject = 'Physics');

-- -------------------------------------------------------
-- Q6: Count how many distinct subjects have ever been awarded in the 1980s

SELECT COUNT(DISTINCT subject) FROM nobel
WHERE yr BETWEEN 1980 AND 1989;

-- -------------------------------------------------------
-- Q7: Show years where a Physics award was given but no Medicine or Peace award was given

SELECT DISTINCT yr FROM nobel
WHERE subject = 'Physics'
AND yr NOT IN (SELECT yr FROM nobel WHERE subject = 'Medicine')
AND yr NOT IN (SELECT yr FROM nobel WHERE subject = 'Peace');

-- -------------------------------------------------------
-- Q8: Show all winners who share the same subject as Albert Einstein

SELECT winner FROM nobel
WHERE subject IN (SELECT subject FROM nobel WHERE winner = 'Albert Einstein')
AND winner <> 'Albert Einstein';

-- -------------------------------------------------------
-- Q9: Show years where more than one Chemistry award was given in the same year

SELECT yr FROM nobel
WHERE subject = 'Chemistry'
GROUP BY yr
HAVING COUNT(winner) > 1;
