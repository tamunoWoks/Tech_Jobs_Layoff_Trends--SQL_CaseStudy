-- CLEAN DATASET

-- 1. Create new database and Import dataset to MySQL
SELECT *
FROM layoffs;

-- 2. Duplicate table to create staging area.
CREATE TABLE layoffs_staging
LIKE layoffs;

SELECT *
FROM layoffs;
