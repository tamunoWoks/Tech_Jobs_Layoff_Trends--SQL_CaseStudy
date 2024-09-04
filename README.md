# Tech Jobs Layoff Trends - An SQL CaseStudy
### INTRODUCTION
This is a data-driven study that focuses on the pattern of job cuts in the tech industry from the onset of the COVID-19 pandemic. I have used SQL(MySQL) for the Analysis.

Through data analysis and visualization, the project aims to uncover trends, patterns, and insights related to layoffs across various tech companies, regions, and job roles. By examining factors such as company size, industry segment, and the timing of layoffs, the project seeks to provide a comprehensive understanding of how the pandemic and subsequent economic conditions have impacted the tech workforce. 

This analysis can be valuable for businesses, policymakers, and professionals seeking to navigate the evolving tech job market.


### DATASET
The dataset used for this project is sourced from Kaggle; and the data availability is from when COVID-19 was declared as a pandemic i.e. 11 March 2020 till (20 July 2024).

[Layoffs Dataset](https://www.kaggle.com/datasets/swaptr/layoffs-2022)

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


### BUSINESS UNDERSTANDING
The business questions to be answered include:
- What are the trends in tech layoffs over time? Are the layoffs increasing, decreasing, or stabilizing?
- Which segments of the tech industry were most affected by layoffs?
- Which regions or countries were most impacted by tech layoffs?
- Which companies had the highest number of layoffs, and what factors contributed to their decisions?
- How did the size of a company correlate with the likelihood or severity of layoffs?
- Which job roles or departments were most affected by the layoffs?
- What were the common reasons cited for layoffs (e.g., financial challenges, restructuring, automation)?
- Did companies that conducted layoffs eventually rehire or stabilize their workforce?
- How did external factors like COVID-19 waves, economic downturns, or technological shifts influence layoff decisions?
- How do tech layoffs compare to other industries during the same period?


### DATA CLEANING
Before we can explore and analyse the data, we must first clean it up to help maintain data integrity.
These are the following steps we will take to ensure the data is clean;
1. Remove duplicates.
2. Standardize data and fix errors.
3. Look at Null values or Blank values. 
4. Remove unnecessary columns and rows.
  
However, before we start manipulating the data, it is best practice to first create a copy of the raw data for backup purposes.

#### Procedure for removing duplicates
- Create new database and import csv file:  
We need to create a new database (world_layoffs) in MySQL so we can upload the dataset (layoffs.csv) and start manipulating the data.  
- Duplicate the original table:  
A copy ensures that the original data remains untouched and safe. If something goes wrong during the manipulation process, you can easily revert to the original state without significant downtime or effort.
- Create new table and add new column to check for duplicates:  
Since the table doesnt have a unique column to sort with, we must create one and add to a new table.
- Delete duplicate rows:  
After sorting table to find duplicate rows, we then delete each row that has more than one entry.

#### Procedure for standardizing data  
