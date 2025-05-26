-- Build the database and import the data


CREATE DATABASE layoffs;
USE layoffs;

-- importing done using Mysql import wizard do not change the formats
USE layoffs;
SELECT * FROM layoffs;

-- Data Cleaning

--  1. Remove duplicates if any
-- 2. Stadardize the data - check letters pelling
-- 3. Handle NULL values
-- 4. remove any columns

-- in order to go back to the data if need be let us create a copy of the data
CREATE TABLE layoffs_bk
LIKE layoffs;

INSERT layoffs_bk
SELECT * FROM layoffS;

SELECT * FROM layoffs_bk;

-- Identify duplicates - Create a new column called row_num that will assign a number 1 to the first observation of the same type and 2 if the same observation is repeated
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location ,industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num
FROM layoffs_bk;

-- build a cte to enable us view the exact duplicates and filter where row_num > 1
WITH duplicate_cte AS(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location ,industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num
FROM layoffs_bk
)
SELECT * 
FROM duplicate_cte
WHERE row_num > 1;
-- duplicate values identified so let us delete them
-- MySQL can not update in the CTE table thus option is to create a new table using the slecte statement the drop values with row_num <1

CREATE TABLE layoffs_clean SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location ,industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num
FROM layoffs_bk;



-- drop values with row_nums > 1
SELECT * FROM layoffs_clean WHERE row_num > 1;

SET SQL_SAFE_UPDATES = 0;	-- Disable safe update mode
DELETE
FROM layoffs_clean
WHERE row_num > 1;

SET SQL_SAFE_UPDATES = 1;	-- enable safe update mode

-- check for more duplicates
SELECT * FROM layoffs_clean WHERE row_num > 1;

-- 0 rows returned all is well

-- 2. Standardizing data

-- TRIM all White spaces
SET SQL_SAFE_UPDATES = 0;	-- Disable safe update mode

UPDATE layoffs_clean
SET company = TRIM(company);

-- check if company disctinct
SELECT DISTINCT company 
FROM layoffs_clean;

SELECT * FROM layoffs_clean;

-- Check on the location column
SELECT location, COUNT(*) AS num
FROM layoffs_clean
GROUP BY location
ORDER BY num DESC; 

-- All is well with the location column

-- check on industry 
SELECT industry, COUNT(*) AS num
FROM layoffs_clean
GROUP BY industry
ORDER BY industry; 

-- there are some blank spaces then there is null and also there are indexes that are repeating e.g. crypocurrency is written in various different formats

-- switching crytpo to only crypto

UPDATE layoffs_clean
SET industry = "Crpto"
WHERE industry LIKE "Crypto%";

-- confirm if it has switched
SELECT industry, COUNT(*) AS num
FROM layoffs_clean
GROUP BY industry
ORDER BY industry; 

-- for the blanks let us see the company name too 

SELECT * FROM layoffs_clean;

-- look at  stage
SELECT stage, COUNT(*) AS num
FROM layoffs_clean
GROUP BY stage
ORDER BY stage; 

-- 6 null values but everything else is okay we shall fix the nulls later

SELECT country, COUNT(*) AS num
FROM layoffs_clean
GROUP BY country
ORDER BY country; 


SELECT DISTINCT country
FROM layoffs_clean
ORDER BY country; 

-- In the country United States, there are two variable on with a period
-- now let us switch

UPDATE layoffs_clean
SET country = "United States"
WHERE country LIKE "United Sta%";

-- Alternatively you can use the TRIM and TRAILLING funvtion i.e. TRIM(TRAILING, '.' FROM country)

-- Next we handle the date column currently it of text format. But it is in thformat MM-dd-yyyy
-- use str_to_date()

UPDATE layoffs_clean
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

-- Change date format
ALTER TABLE layoffs_clean
MODIFY COLUMN `date` DATE;

SELECT * FROM layoffs_clean;

-- Handling NULL and Blank Values

-- starting with Industry
SELECT * 
FROM layoffs_clean
WHERE industry IS NULL OR industry = '';

-- cleaning each one by 1
-- airbnb
SELECT * 
FROM layoffs_clean
WHERE company = 'Airbnb'; 
-- set all airbnb to industry

UPDATE layoffs_clean
SET industry = 'Travel'
WHERE company ='Airbnb';

-- next Juul
SELECT * 
FROM layoffs_clean
WHERE company = 'Juul';

-- set to Consumer
UPDATE layoffs_clean
SET industry = 'Consumer'
WHERE company ='Juul';

-- Carvana
SELECT * 
FROM layoffs_clean
WHERE company = 'Carvana'; 

-- Set to Transporation
UPDATE layoffs_clean
SET industry = 'Transportation'
WHERE company ='Carvana';

-- total laid off
-- if total laid off and percentage laid is NULL or blank we can drop

SELECT * 
FROM layoffs_clean
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

-- droping the values
DELETE 
FROM layoffs_clean
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;


SELECT * 
FROM layoffs_clean
WHERE funds_raised_millions IS NULL OR funds_raised_millions  = '';

-- Drop the row num column
ALTER TABLE layoffs_clean
DROP COLUMN row_num;

-- 