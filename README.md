# Tech Jobs Layoff Trends - An SQL CaseStudy
### INTRODUCTION
This is a data-driven study that focuses on the pattern of job cuts in tech companies from the onset of the COVID-19 pandemic. I have used SQL(MySQL) for the Analysis.

Through data analysis and visualization, the project aims to uncover trends, patterns, and insights related to layoffs across various tech companies, regions, and job roles. By examining factors such as company size, industry segment, and the timing of layoffs, the project seeks to provide a comprehensive understanding of how the pandemic and subsequent economic conditions have impacted the tech workforce. 

This analysis can be valuable for businesses, policymakers, and professionals seeking to navigate the evolving tech job market.  

This project focuses on exploring and cleaning a dataset of layoffs. The goal is to perform data analysis, derive insights, and provide a clear understanding of trends in the dataset. The project involves three primary steps: data cleaning, data exploration and data visualization.


### DATA OVERVIEW
The dataset used for this project is sourced from Kaggle; and the data availability is from when COVID-19 was declared as a pandemic i.e. 11 March 2020 till (20 July 2024).

Dataset -> [Layoffs Dataset](https://www.kaggle.com/datasets/swaptr/layoffs-2022)

The dataset consists of nine(9) colums:
- Company: Name of the company.
- Location: Location of company headquarters.
- Industry: Industry of the company.
- Total_laid_off: Number of employees laid off
- Percentage_laid_off: Percentage of employees laid off.
- Date: Date of layoff.
- Stage: Company stage of funding at the time of layoff.
- Country: Country.
- Funds_raised: Funds raised by the company (in Millions $).


### PROBLEM STATEMENT
The business questions to be answered include:
- What is the date range of the data we are working with?
- Are the layoffs increasing, decreasing, or stabilizing?
- Which industries were most affected by layoffs?
- Which regions or countries were most impacted by the layoffs?
- Which companies had the highest number of layoffs?
- How did the size of a company correlate with the likelihood or severity of layoffs?

### METHODOLOGY  
- Data Cleaning.
- Exploratory Data Analysis (EDA).

#### DATA CLEANING
Data Cleaning SQL file -> [Data_cleaning.sql](https://github.com/tamunoWoks/Tech_Jobs_Layoff_Trends--SQL_CaseStudy/blob/main/Data_cleaning.sql)  

Before we can explore and analyse the data, we must first clean it up to help maintain data integrity.
These are the following steps we will take to ensure the data is clean;
1. Remove duplicates.
2. Standardize data and fix errors.
3. Look at Null values or Blank values. 
4. Remove unnecessary data.
  
However, before we start manipulating the data, it is best practice to first create a copy of the raw data for backup purposes.

##### Procedure for removing duplicates
Having duplicate entries in a dataset can skew patterns when it comes to pattern recognition and data visualization. It is important that every unique record appears only once.  In this case study, the steps taken to remove all duplicate records from the dataset are given below: 
- Create new database and import csv file:  
We need to create a new database (world_layoffs) in MySQL so we can upload the dataset (layoffs.csv) and start manipulating the data.  
- Duplicate the original table:  
A copy ensures that the original data remains untouched and safe. If something goes wrong during the manipulation process, you can easily revert to the original state without significant downtime or effort.
- Create new table and add new column to check for duplicates:  
Since the table doesnt have a unique column to sort with, we must create one and add to a new table.
- Delete duplicate rows:  
After sorting table to find duplicate rows, we then delete each row that has more than one entry.

##### Procedure for standardizing data  
- Trim whitepaces in column 1 entries:  
Trimming unnecessary whitespaces in our data helps maintain data integrity. In the company column, the crypto industry is represented with several labels, we need to make them unique.
- Merge similar industries with same label:  
The Crypto industry is represented with different labels, hence we set them all to a single label.
- Merge similar countries with same label:  
The United States is represented with different labels, hence we set them all to a single label.
- Change DATE format from text to datetime:  
The date colum has its entries in a text format, we have to change the data type and set the format to the standard date format.

##### Procedure for handling NULL and blank values
- Change all blank entries in the industry column to NULLS:  
So we can easily populate the missing values, we need to change all blank entries in the industry column to NULLS for easy manipulation.
- Populate NULL entries in the industry colum where possible:  
We can use the data from other records to populate similar records with missing values in the industry column.  
  
Unfortunately we do not have enough data to populate other columns with null values. So we will stop at the industry column.

##### Procedure for deleting unnecessary data
- Delete irrelevant row:  
Because some rows do not have enough information, we have to delete them from the table so we can explore relevant data properly.
- Delete temporary columns created during data cleaning:  
Since we had to create an extra column (row_num) while cleaning our data, it is only reasonable to delete it once we are done.

#### EXPLORATORY DATA ANALYSIS (EDA)

Exploratory Data Analysis SQL file -> [EDA.sql](https://github.com/tamunoWoks/Tech_Jobs_Layoff_Trends--SQL_CaseStudy/blob/main/Exploratory_data_analysis.sql)  

Here we will query our dataset to answer particular questions for us.


### CHALLENGES
Some of the challenges faced while cleaning and exploring the dataset include:
- Incomplete Data:  
Because some key columns were missing in the dataset, we couldn't populate certain columns like the total_laid_off column and the percentage_laid_off column which had several missing entries.
- Deleting rows:  
Some records in the dataset did not have enough information for exploration, hence we had to delete over a hundred records in the dataset.
