-- My First SQL Project

/* This is my first SQL project, here I will do the following:
1. Create a database
2. Add some tables (4)
3. Run some commands
	SELECT, ORDER BY and DISTINCT
    Aggregate functions - COUNT, MIN, MAX, SUM, AVG, GROUP BY and HAVING
4. Create a new column by calculation
5. Join Tables
*/

/* Modern Times Agriculture Limited is an agricultiral family business located in the outskirts of Eldoret, Kenya. The business sits on 23 acre 
piece of land and is involved in both crop and animal farming. This is a database recording the activites in the farm. The farm is managed by 
the owner with the help of a foreman.
*/

-- Creating the database
CREATE DATABASE modern_agrics;

USE modern_agrics;

-- Adding Tables

-- Table 1 - crops

CREATE TABLE `crops` (
`crop_id` varchar(4) NOT NULL,			-- unique idendification of the crop
`crop_name` varchar(25) NOT NULL,	-- crop name	
`farmer_incharge` varchar(25) NOT NULL,	-- specialist farmer in charge of the crop
`acerage` decimal(4, 2) NOT NULL,			-- land under plantation
`land_type` varchar(25) NOT NULL,	-- categorization of where the crop is planted - green house or open field
`season` int NOT NULL,			-- number of season under plantation
`planting_date` date NOT NULL,		-- date of planting of the current season
`harvest_date` date NOT NULL);		-- expected date of havesrting of the current season or when the crop will be completely uprooted

-- Inserting values

INSERT INTO `crops` VALUES ('C001', 'Maize', 'Mary Kilobi', 5.00,  'Open Field', 2, '2023-09-21', '2023-03-23');
INSERT INTO `crops` VALUES ('C002', 'Napier Grass', 'Mary Kilobi', 2,  'Open Field', 3, '2020-04-01', '2025-03-23');
INSERT INTO `crops` VALUES ('C003', 'Strawberry', 'Peter Kipkosiom', 0.05,  'Green House', 1, '2018-07-13', '2024-01-23');
INSERT INTO `crops` VALUES ('C004', 'Macademia Nuts', 'James Macharia', 0.25,  'Open Field', 10, '2013-11-26', '2030-11-30');
INSERT INTO `crops` VALUES ('C005', 'Tomatoes', 'Peter Kipkosiom', 0.25,  'Green House', 1, '2023-12-12', '2024-04-12');
INSERT INTO `crops` VALUES ('C006', 'Carrots', 'Ann Mwende', 0.1,  'Open Field', 1, '2023-11-16', '2024-01-23');
INSERT INTO `crops` VALUES ('C007', 'Green Capcicum', 'Ann Mwende', 0.03,  'Green House', 5, '2023-11-16', '2024-01-23');

-- Table 2 - animals

CREATE TABLE `animals` (
`animal_id` varchar(4) NOT NULL,			-- unique idendification of the animal
`animal_name` varchar(25) NOT NULL,			-- animal name	
`animal_count` int NOT NULL,				-- number of animals
`farmer_incharge` varchar(25) NOT NULL,		-- specialist farmer in charge of the crop
`product` varchar(25) NOT NULL,				-- number of season under plantation
`unit_measure` varchar(25) NOT NULL,		-- unit of measurement of the product
`yield` int NOT NULL);						-- annual yield of product from animal

-- Inserting values
INSERT INTO `animals` VALUES ('A001', 'Dairy Cows', 4, 'Peter Kipkosiom', 'Milk', 'Litres', 9260);
INSERT INTO `animals` VALUES ('A002', 'Layer Chickens', 380, 'Ann Mwende', 'Eggs', 'Trays', 74500);
INSERT INTO `animals` VALUES ('A003', 'Broiler Chickens', 100 , 'Ann Mwende', 'Meat', 'Kgs', 40);
INSERT INTO `animals` VALUES ('A004', 'Rabbits', 64, 'James Macharia', 'Meat', 'Kgs', 30);

-- Table 3 - Staff

CREATE TABLE `staff` (
`staff_id` varchar(4) NOT NULL,			-- unique idendification of staff
`staff_name` varchar(25) NOT NULL,		-- animal name	
`dob` date NOT NULL,					-- date of birth
`sex` varchar(9), 						-- Male/Female
`role` varchar(25) NOT NULL,			-- role of staff
`specialty` varchar(25) NOT NULL,		-- area of specialization of staff
`emp_date` date NOT NULL, 				-- date of employment 
`salary` int NOT NULL);					-- monthly salary of staff

-- Insering values
INSERT INTO `staff` VALUES ('S001', 'Johnstone Kimaiyo', '1972-04-30' , 'Male','Foreman', 'Dairy Farming', '2012-02-17' , 69219);
INSERT INTO `staff` VALUES ('S002', 'Mary Kilobi', '1990-12-14', 'Female' , 'Trainer', 'Maize farming', '2013-06-16', 41230);
INSERT INTO `staff` VALUES ('S003', 'Ann Mwende', '1981-03-17', 'Female', 'Accounting', 'Green House Plantation', '2012-04-08', 57884);
INSERT INTO `staff` VALUES ('S004', 'Peter Kipkosiom', '1995-06-10', 'Male',  'Dairy', 'Dairy', '2012-02-17', 60000);
INSERT INTO `staff` VALUES ('S005', 'James Macharia', '1969-04-13', 'Male',  'Logistics', 'Nuts farming', '2014-08-01', 58900);

-- Table 4 - Annual Production by Year

CREATE TABLE `production` (
`product_id` varchar(4) NOT NULL,			-- crop_id / animal_id
`product_name` varchar(25) NOT NULL, 		-- product name
`year` int NOT NULL,						-- year of production
`quantity` int NOT NULL,					-- total production of the year
`unit_measure` varchar(25) NOT NULL,		-- unit of measurement of the product
`unit_price` int NOT NULL);					-- average market price for the year

-- Inserting values
INSERT INTO `production` VALUES ('C001', 'Maize', 2022, 117, '90-kg bag', 3450);
INSERT INTO `production` VALUES ('C001', 'Maize', 2023, 110, '90-kg bag', 4000);
INSERT INTO `production` VALUES ('A001', 'Milk', 2012, 3060, 'Litres', 35);
INSERT INTO `production` VALUES ('A001', 'Milk', 2013, 3321, 'Litres', 34);
INSERT INTO `production` VALUES ('A001', 'Milk', 2014, 4491, 'Litres', 37);
INSERT INTO `production` VALUES ('A001', 'Milk', 2015, 4230, 'Litres', 37);
INSERT INTO `production` VALUES ('A001', 'Milk', 2016, 5216, 'Litres', 36);
INSERT INTO `production` VALUES ('A001', 'Milk', 2017, 6008, 'Litres', 39);
INSERT INTO `production` VALUES ('A001', 'Milk', 2018, 7991, 'Litres', 40);
INSERT INTO `production` VALUES ('A001', 'Milk', 2019, 8900, 'Litres', 42);
INSERT INTO `production` VALUES ('A001', 'Milk', 2020, 8840, 'Litres', 42);
INSERT INTO `production` VALUES ('A001', 'Milk', 2021, 8900, 'Litres', 45);
INSERT INTO `production` VALUES ('A001', 'Milk', 2022, 9260, 'Litres', 48);
INSERT INTO `production` VALUES ('A002', 'Eggs', 2020, 62500, 'Trays', 290);
INSERT INTO `production` VALUES ('A002', 'Eggs', 2021, 59500, 'Trays', 310);
INSERT INTO `production` VALUES ('A002', 'Eggs', 2022, 49633, 'Trays', 280);
INSERT INTO `production` VALUES ('A002', 'Eggs', 2023, 74500, 'Trays', 320);
INSERT INTO `production` VALUES ('A003', 'Broiler Chicken Meat', 2022, 30, 'Kgs', 310);
INSERT INTO `production` VALUES ('A003', 'Broiler Chicken Meat', 2023, 40, 'Kgs', 410);
INSERT INTO `production` VALUES ('A004', 'Rabbit Meat', 2023, 30, 'Kgs', 500);
INSERT INTO `production` VALUES ('C003', 'Strawberry', 2023, 10, 'Kgs', 1320);
INSERT INTO `production` VALUES ('C004', 'Macademia Nuts', 2022, 57, 'Kgs', 3250);
INSERT INTO `production` VALUES ('C004', 'Macademia Nuts', 2023, 63, 'Kgs', 3442);
INSERT INTO `production` VALUES ('C005', 'Tomatoes', 2023, 13, 'Crate', 2650);
INSERT INTO `production` VALUES ('C006', 'Carrots', 2023, 47, 'Kgs', 169);
INSERT INTO `production` VALUES ('C007', 'Green Capcicum', 2022, 97, 'Kgs', 161);
INSERT INTO `production` VALUES ('C007', 'Green Capcicum', 2023, 125, 'Kgs', 171);


-- Manipulating the database and answering some questions
-- 1. How much did the farm earn from each product?
-- First let us create the new column of sales

SET SQL_SAFE_UPDATES = 0;	-- Disable safe update mode

ALTER TABLE `production` ADD COLUMN `sales` int;
UPDATE `production` SET `sales` = `unit_price` * `quantity`;

-- selecting product name and sales
SELECT `product_name`, SUM(`sales`) AS total_sales
FROM `production`
GROUP BY `product_name` WITH ROLLUP;

SET SQL_SAFE_UPDATES = 1;	-- Enable safe update mode

-- 2. How much did the farm earn product by year?

SELECT `year`, SUM(`sales`) AS total_sales
FROM `production`
GROUP BY `year` WITH ROLLUP;

-- 3. How much did each product earn the farm per year?
-- Display sales by product_id and year in wide format (up to 2023)
SELECT
  `product_name`,
  SUM(CASE WHEN `year` = 2012 THEN `sales` ELSE 0 END) AS `2012`,
  SUM(CASE WHEN `year` = 2013 THEN `sales` ELSE 0 END) AS `2013`,
  SUM(CASE WHEN `year` = 2014 THEN `sales` ELSE 0 END) AS `2014`,
  SUM(CASE WHEN `year` = 2015 THEN `sales` ELSE 0 END) AS `2015`,
  SUM(CASE WHEN `year` = 2016 THEN `sales` ELSE 0 END) AS `2016`,
  SUM(CASE WHEN `year` = 2017 THEN `sales` ELSE 0 END) AS `2017`,
  SUM(CASE WHEN `year` = 2018 THEN `sales` ELSE 0 END) AS `2018`,
  SUM(CASE WHEN `year` = 2019 THEN `sales` ELSE 0 END) AS `2019`,
  SUM(CASE WHEN `year` = 2020 THEN `sales` ELSE 0 END) AS `2020`,
  SUM(CASE WHEN `year` = 2021 THEN `sales` ELSE 0 END) AS `2021`,
  SUM(CASE WHEN `year` = 2022 THEN `sales` ELSE 0 END) AS `2022`,
  SUM(CASE WHEN `year` = 2023 THEN `sales` ELSE 0 END) AS `2023`
FROM `production`
GROUP BY `product_name` WITH ROLLUP;

