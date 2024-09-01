-- CLEAN DATASET


-- CREATE NEW DATABASE & IMPORT DATASET TO MYSQL

-- Create new staging table:
CREATE TABLE world_layoffs.layoffs_staging 
LIKE world_layoffs.layoffs;

-- Insert the data into new table:
INSERT world_layoffs.layoffs_staging
SELECT *
FROM world_layoffs.layoffs;


-- 1. REMOVE DUPLICATE ROWS

-- Add new column (row number) to check for duplicates
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions
) AS row_num
FROM world_layoffs.layoffs_staging;

-- Save as CTE and display rows with duplicate
WITH duplicate_cte AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions
) AS row_num
FROM world_layoffs.layoffs_staging
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1;
