-- CLEAN DATASET


-- CREATE NEW DATABASE & IMPORT DATASET TO MYSQL

-- Create new table as staging area.
CREATE TABLE layoffs_staging
LIKE layoffs;

SELECT *
FROM layoffs_staging;

-- Insert the data into new table:
INSERT layoffs_staging
SELECT *
FROM layoffs;


-- REMOVE DUPLICATE ROWS

-- Add new column (row number)
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions
) AS row_num
FROM layoffs_staging;

-- Save as CTE and display rows with duplicate
WITH duplicate_cte AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions
) AS row_num
FROM layoffs_staging
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1;
