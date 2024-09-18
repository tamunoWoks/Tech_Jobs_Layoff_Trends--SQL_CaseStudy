## DATA CLEANING
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
