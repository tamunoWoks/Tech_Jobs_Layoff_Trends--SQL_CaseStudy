-- Exploratory Data Analysis

SELECT *
FROM world_layoffs.layoffs_staging2;


-- Retrieve the maximum number of employees laid off by a company
SELECT MAX(total_laid_off)
FROM world_layoffs.layoffs_staging2;
-- Output: 12000


-- Retrieve both the maximum and minimum values of the percentage laid off
SELECT MAX(percentage_laid_off),  MIN(percentage_laid_off)
FROM world_layoffs.layoffs_staging2
WHERE  percentage_laid_off IS NOT NULL;
-- OUTPUT: Max = 1, Min = 0


-- Retrieve the list of companies who had 100 percent lay off
SELECT *
FROM world_layoffs.layoffs_staging2
WHERE  percentage_laid_off = 1;
-- These are the companies who went out of business during this time


-- Let's see the financial strength of the companies who went out of business
SELECT *
FROM world_layoffs.layoffs_staging2
WHERE  percentage_laid_off = 1
ORDER BY funds_raised_millions DESC;
-- The top 5 companies that went out of business raised over $1b dollars


-- Companies with the biggest Layoff in a single day
SELECT company, total_laid_off
FROM world_layoffs.layoffs_staging
ORDER BY 2 DESC
LIMIT 5;
-- Google laid off 12000 workers in a single day


-- Companies with the most Total Layoffs
SELECT company, SUM(total_laid_off)
FROM world_layoffs.layoffs_staging2
GROUP BY company
ORDER BY 2 DESC
LIMIT 10;
-- Amazon leads with a total of 18150 layoffs


-- total number of employees laid off according to location 
SELECT location, SUM(total_laid_off)
FROM world_layoffs.layoffs_staging2
GROUP BY location
ORDER BY 2 DESC
LIMIT 10;
-- The San Francisco Bay Area had the most lay offs


-- total number of employees laid off according to country
SELECT country, SUM(total_laid_off)
FROM world_layoffs.layoffs_staging2
GROUP BY country
ORDER BY 2 DESC;
-- The United States had the most with 256559 lay offs


-- Total number of employees laid off each year in ascending order.
SELECT YEAR(date), SUM(total_laid_off)
FROM world_layoffs.layoffs_staging2
GROUP BY YEAR(date)
ORDER BY 1 ASC;
-- 2023 has the most lay off


-- Aggregate and sort the total number of layoffs by industry
SELECT industry, SUM(total_laid_off)
FROM world_layoffs.layoffs_staging2
GROUP BY industry
ORDER BY 2 DESC;
-- The Consumer industry had the most layoffs with 45182 lay offs


-- Summarize the total number of employees laid off for each funding stage in descending order
SELECT stage, SUM(total_laid_off)
FROM world_layoffs.layoffs_staging2
GROUP BY stage
ORDER BY 2 DESC;
-- The stage with the most layoffs is Post-IPO


-- find the top 3 companies with the highest total layoffs for each year and order the results by year and layoffs.
WITH Company_Year AS 
(
  SELECT company, YEAR(date) AS years, SUM(total_laid_off) AS total_laid_off
  FROM world_layoffs.layoffs_staging2
  GROUP BY company, YEAR(date)
)
, Company_Year_Rank AS (
  SELECT company, years, total_laid_off, DENSE_RANK() OVER (PARTITION BY years ORDER BY total_laid_off DESC) AS ranking
  FROM Company_Year
)
SELECT company, years, total_laid_off, ranking
FROM Company_Year_Rank
WHERE ranking <= 3
AND years IS NOT NULL
ORDER BY years ASC, total_laid_off DESC;


-- Rolling Total of Layoffs Per Month
SELECT SUBSTRING(date,1,7) as dates, SUM(total_laid_off) AS total_laid_off
FROM world_layoffs.layoffs_staging2
GROUP BY dates
ORDER BY dates ASC;


-- rolling total of the number of employees laid off for each month and year, showing the cumulative sum over time.
WITH DATE_CTE AS 
(
SELECT SUBSTRING(date,1,7) as dates, SUM(total_laid_off) AS total_laid_off
FROM world_layoffs.layoffs_staging2
GROUP BY dates
ORDER BY dates ASC
)
SELECT dates, SUM(total_laid_off) OVER (ORDER BY dates ASC) as rolling_total_layoffs
FROM DATE_CTE
ORDER BY dates ASC;
