# Tech Jobs Layoff Trends - An SQL CaseStudy
### INTRODUCTION
This is a data-driven study that focuses on the pattern of job cuts in tech companies from the onset of the COVID-19 pandemic. I have used SQL(MySQL) for the Analysis.

Through data analysis and visualization, the project aims to uncover trends, patterns, and insights related to layoffs across various tech companies, regions, and job roles. By examining factors such as company size, industry segment, and the timing of layoffs, the project seeks to provide a comprehensive understanding of how the pandemic and subsequent economic conditions have impacted the tech workforce. 

This analysis can be valuable for businesses, policymakers, and professionals seeking to navigate the evolving tech job market.  

This project focuses on exploring and cleaning a dataset of layoffs. The goal is to perform data analysis, derive insights, and provide a clear understanding of trends in the dataset. The project involves three primary steps: data cleaning, data exploration and data visualization.  

### Files in the Project  
#### [Data_cleaning.md](https://github.com/tamunoWoks/Tech_Jobs_Layoff_Trends--SQL_CaseStudy/blob/main/Data_cleaning.md)
A Markdown file detailing the steps taken during the Data cleaning process.

#### [Data_cleaning.sql](https://github.com/tamunoWoks/Tech_Jobs_Layoff_Trends--SQL_CaseStudy/blob/main/Data_cleaning.sql)
This SQL script cleans the layoffs dataset by handling issues such as missing values, inconsistencies, and formatting problems. Key steps include:  
- Identifying and handling null values
- Removing duplicates
- Standardizing data types for key columns (e.g., date, numerical values)
- Renaming columns for clarity.  

#### [EDA.md](https://github.com/tamunoWoks/Tech_Jobs_Layoff_Trends--SQL_CaseStudy/blob/main/EDA.md)
A Markdown file detailing the steps taken during the process of Data Exploration.  

#### [Exploratory_data_analysis.sql](https://github.com/tamunoWoks/Tech_Jobs_Layoff_Trends--SQL_CaseStudy/blob/main/Exploratory_data_analysis.sql)  
This SQL script explores the layoffs dataset to identify trends, relationships, and key metrics. Key steps include:  
- Data summary and structure examination
- Querying for layoff trends by industry, date, and company.
- 
#### [Layoffs.csv](https://github.com/tamunoWoks/Tech_Jobs_Layoff_Trends--SQL_CaseStudy/blob/main/layoffs.csv)
This CSV file contains the raw data used in the analysis.

##### DATA OVERVIEW
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


### CHALLENGES
Some of the challenges faced while cleaning and exploring the dataset include:
- Incomplete Data:  
Because some key columns were missing in the dataset, we couldn't populate certain columns like the total_laid_off column and the percentage_laid_off column which had several missing entries.
- Deleting rows:  
Some records in the dataset did not have enough information for exploration, hence we had to delete over a hundred records in the dataset.
