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

-- Create a new column and add those row numbers in.
ALTER TABLE world_layoffs.layoffs_staging 
ADD row_num INT;

-- Create new table for duplicate rows:
CREATE TABLE `world_layoffs`.`layoffs_staging2` (
`company` text,
`location`text,
`industry`text,
`total_laid_off` INT,
`percentage_laid_off` text,
`date` text,
`stage`text,
`country` text,
`funds_raised_millions` int,
row_num INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Insert duplicate rows into empty table
INSERT INTO `world_layoffs`.`layoffs_staging2`
SELECT *,
ROW_NUMBER() OVER (
PARTITION BY company, location, industry, total_laid_off,percentage_laid_off,`date`, stage,
country, funds_raised_millions) AS row_num
FROM world_layoffs.layoffs_staging;

-- Delete rows were row_num is greater than 2
DELETE 
FROM world_layoffs.layoffs_staging2
WHERE row_num >= 2;



-- 2. STANDARDIZING DATA

-- Trim whitespace from the company column
UPDATE layoffs_staging2
SET company = TRIM(company);

-- MERGE similar industries with unique label
UPDATE layoffs_staging2
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';

-- MERGE similar countries with unique label
UPDATE layoffs_staging2
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'United States%';

-- Change DATE column data type from text to datetime
UPDATE layoffs_staging2
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

ALTER TABLE layoffs_staging2
MODIFY COLUMN `date` DATE;



-- 3. Handle NULL and Blank entries

-- Change all blank entries in the industry column to NULLS:
UPDATE layoffs_staging2
SET industry = NULL
WHERE industry = '';

-- Populate NULL entries in industry column where possible:
UPDATE layoffs_staging2 AS t1
JOIN layoffs_staging2 AS t2
	ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE t1.industry IS NULL
AND t2.industry IS NOT NULL;

-- 4. Delete irrelevant records:

-- Delete all columns with incomplete information fromthe dataset:
DELETE
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;
