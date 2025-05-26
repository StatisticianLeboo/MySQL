# 🧹 SQL Project: Data Cleaning on Layoffs Dataset

## 📌 Project Overview

This project focuses on cleaning and standardizing a layoffs dataset using **MySQL**, following my learning on Alex the Analyst YouTube channel. The raw dataset includes layoff records from various companies across industries, countries, and stages of funding. The goal was to prepare the data for further analysis by removing inconsistencies, handling missing values, and formatting key variables such as dates and categories.

> ✅ The cleaned dataset will serve as the foundation for **Project 2: Data Exploration and Analysis using SQL**.

---

## ⚙️ Key Tasks Performed

### 1. Database Setup
- Created a new database `layoffs` and imported the raw dataset using the MySQL Import Wizard.
- Created a backup table `layoffs_bk` to preserve the original data for recovery purposes.

### 2. Duplicate Removal
- Applied `ROW_NUMBER()` with `PARTITION BY` to identify exact duplicates.
- Removed rows with duplicate entries across key columns such as `company`, `industry`, and `date`.

### 3. Standardization
- Used SQL string functions (`TRIM`, `LIKE`) to:
  - Fix inconsistent spacing.
  - Standardize industry names (e.g., "Crypto", "Transportation").
  - Correct country names (e.g., "United States." → "United States").

### 4. Data Type Formatting
- Transformed the `date` column from text to SQL `DATE` format using `STR_TO_DATE()` and `ALTER TABLE`.

### 5. Handling Missing and NULL Values
- Replaced missing `industry` values using business logic (e.g., Airbnb → Travel).
- Removed rows where both `total_laid_off` and `percentage_laid_off` were missing.

### 6. Clean-Up
- Dropped temporary columns such as `row_num` and validated the final structure.
---

# 📊 Outcome

- ✅ A fully cleaned and standardized dataset ready for data exploration and visualization.
- 🔜 This data will be used in **Project 2** to uncover trends in layoffs by industry, geography, and funding status.
---

## 🛠 Tools Used

- **MySQL Workbench**
- SQL Functions: `ROW_NUMBER()`, `CTE`, `TRIM()`, `STR_TO_DATE()`, `UPDATE`, `DELETE`
- Data Cleaning & Quality Assurance

---

## 📁 Next Steps

Perform data exploration on the cleaned data

