-- CLEAN DATASET

-- 1. Create new database and Import dataset to MySQL
SELECT *
FROM layoffs;

-- 2. Create new table as staging area.
CREATE TABLE layoffs_staging
LIKE layoffs;

SELECT *
FROM layoffs;

-- 3. Insert the data into new table:
INSERT layoffs_staging
SELECT *
FROM layoffs;


-- REMOVE DUPLICATE ROWS
