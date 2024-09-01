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
