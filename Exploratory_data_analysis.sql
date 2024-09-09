-- Exploratory Data Analysis

SELECT *
FROM layoffs_staging2;


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
