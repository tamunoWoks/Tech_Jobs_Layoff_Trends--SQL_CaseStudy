-- Exploratory Data Analysis

SELECT *
FROM layoffs_staging2;


-- Maximum number of employees laid off by a company
SELECT MAX(total_laid_off)
FROM world_layoffs.layoffs_staging2;
-- Output: 12000


-- Retrieve both the maximum and minimum values of the percentage laid off
SELECT MAX(percentage_laid_off),  MIN(percentage_laid_off)
FROM world_layoffs.layoffs_staging2
WHERE  percentage_laid_off IS NOT NULL;
-- OUTPUT: Max = 1, Min = 0
