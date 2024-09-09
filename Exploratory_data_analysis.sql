-- Exploratory Data Analysis

SELECT *
FROM layoffs_staging2;


-- Maximum number of employees laid off by a company
SELECT MAX(total_laid_off)
FROM world_layoffs.layoffs_staging2;
