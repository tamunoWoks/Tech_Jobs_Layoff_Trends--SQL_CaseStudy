## DATA CLEANING  
Data Cleaning SQL file -> [Data_cleaning.sql](https://github.com/tamunoWoks/Tech_Jobs_Layoff_Trends--SQL_CaseStudy/blob/main/Data_cleaning.sql)  

Before we can explore and analyse the data, we must first clean it up to help maintain data integrity. These are the following steps we will take to ensure the data is clean;

1. Remove duplicates.
2. Standardize data and fix errors.
3. Look at Null values or Blank values.
4. Remove unnecessary data.

However, before we start manipulating the data, it is best practice to first create a copy of the raw data for backup purposes.

### Procedure for removing duplicates
Having duplicate entries in a dataset can skew patterns when it comes to pattern recognition and data visualization. It is important that every unique record appears only once. In this case study, the steps taken to remove all duplicate records from the dataset are given below:

- Create new database and import csv file:  
We need to create a new database (world_layoffs) in MySQL so we can upload the dataset (layoffs.csv) and start manipulating the data.
- Duplicate the original table:  
A copy ensures that the original data remains untouched and safe. If something goes wrong during the manipulation process, you can easily revert to the original state without significant downtime or effort.
- Create new table and add new column to check for duplicates:  
Since the table doesnt have a unique column to sort with, we must create one and add to a new table.
- Delete duplicate rows:  
After sorting table to find duplicate rows, we then delete each row that has more than one entry.

### Procedure for standardizing data
- Trim whitepaces in column 1 entries:  
Trimming unnecessary whitespaces in our data helps maintain data integrity. In the company column, the crypto industry is represented with several labels, we need to make them unique.
- Merge similar industries with same label:  
The Crypto industry is represented with different labels, hence we set them all to a single label.
- Merge similar countries with same label:  
The United States is represented with different labels, hence we set them all to a single label.
- Change DATE format from text to datetime:  
The date colum has its entries in a text format, we have to change the data type and set the format to the standard date format.

### Procedure for handling NULL and blank values
- Change all blank entries in the industry column to NULLS:  
So we can easily populate the missing values, we need to change all blank entries in the industry column to NULLS for easy manipulation.
- Populate NULL entries in the industry colum where possible:  
We can use the data from other records to populate similar records with missing values in the industry column.  

Unfortunately we do not have enough data to populate other columns with null values. So we will stop at the industry column.

### Procedure for deleting unnecessary data
- Delete irrelevant row:  
Because some rows do not have enough information, we have to delete them from the table so we can explore relevant data properly.
- Delete temporary columns created during data cleaning:  
Since we had to create an extra column (row_num) while cleaning our data, it is only reasonable to delete it once we are done.

