<center>
    <img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/Module%205/images/IDSNlogo.png" width="300" alt="cognitiveclass.ai logo"  />
</center>

# Analyzing a real world data-set with SQL and Python

Estimated time needed: **15** minutes

## Objectives

After completing this lab you will be able to:

*   Understand a dataset of selected socioeconomic indicators in Chicago
*   Learn how to store data in an Db2 database on IBM Cloud instance
*   Solve example problems to practice your SQL skills


## Selected Socioeconomic Indicators in Chicago

The city of Chicago released a dataset of socioeconomic data to the Chicago City Portal.
This dataset contains a selection of six socioeconomic indicators of public health significance and a “hardship index,” for each Chicago community area, for the years 2008 – 2012.

Scores on the hardship index can range from 1 to 100, with a higher index number representing a greater level of hardship.

A detailed description of the dataset can be found on [the city of Chicago's website](https://data.cityofchicago.org/Health-Human-Services/Census-Data-Selected-socioeconomic-indicators-in-C/kn9c-c2s2?utm_medium=Exinfluencer&utm_source=Exinfluencer&utm_content=000026UJ&utm_term=10006555&utm_id=NA-SkillsNetwork-Channel-SkillsNetworkCoursesIBMDeveloperSkillsNetworkDB0201ENSkillsNetwork20127838-2021-01-01), but to summarize, the dataset has the following variables:

*   **Community Area Number** (`ca`): Used to uniquely identify each row of the dataset

*   **Community Area Name** (`community_area_name`): The name of the region in the city of Chicago

*   **Percent of Housing Crowded** (`percent_of_housing_crowded`): Percent of occupied housing units with more than one person per room

*   **Percent Households Below Poverty** (`percent_households_below_poverty`): Percent of households living below the federal poverty line

*   **Percent Aged 16+ Unemployed** (`percent_aged_16_unemployed`): Percent of persons over the age of 16 years that are unemployed

*   **Percent Aged 25+ without High School Diploma** (`percent_aged_25_without_high_school_diploma`): Percent of persons over the age of 25 years without a high school education

*   **Percent Aged Under** 18 or Over 64:Percent of population under 18 or over 64 years of age (`percent_aged_under_18_or_over_64`): (ie. dependents)

*   **Per Capita Income** (`per_capita_income_`): Community Area per capita income is estimated as the sum of tract-level aggragate incomes divided by the total population

*   **Hardship Index** (`hardship_index`): Score that incorporates each of the six selected socioeconomic indicators

In this Lab, we'll take a look at the variables in the socioeconomic indicators dataset and do some basic analysis with Python.


### Connect to the database

Let us first load the SQL extension and establish a connection with the database



```python
!pip install sqlalchemy==1.3.9
!pip install ibm_db_sa
```

    Requirement already satisfied: sqlalchemy==1.3.9 in /home/jupyterlab/conda/envs/python/lib/python3.7/site-packages (1.3.9)
    Requirement already satisfied: ibm_db_sa in /home/jupyterlab/conda/envs/python/lib/python3.7/site-packages (0.3.7)
    Requirement already satisfied: ibm-db>=2.0.0 in /home/jupyterlab/conda/envs/python/lib/python3.7/site-packages (from ibm_db_sa) (3.1.0)
    Requirement already satisfied: sqlalchemy>=0.7.3 in /home/jupyterlab/conda/envs/python/lib/python3.7/site-packages (from ibm_db_sa) (1.3.9)



```python
%load_ext sql
```


```python
# Remember the connection string is of the format:
# %sql ibm_db_sa://my-username:my-password@hostname:port/BLUDB?security=SSL
# Enter the connection string for your Db2 on Cloud database instance below
# i.e. copy after db2:// from the URI string in Service Credentials of your Db2 instance. Remove the double quotes at the end.
%sql db2://dvt73383:dmDwNaycCoY3zqIr@2d46b6b4-cbf6-40eb-bbce-6251e6ba0300.bs2io90l08kqb1od8lcg.databases.appdomain.cloud:32328/BLUDB?security=SSL
```




    'Connected: dvt73383@BLUDB'



### Store the dataset in a Table

##### In many cases the dataset to be analyzed is available as a .CSV (comma separated values) file, perhaps on the internet. To analyze the data using SQL, it first needs to be stored in the database.

##### We will first read the dataset source .CSV from the internet into pandas dataframe

##### Then we need to create a table in our Db2 database to store the dataset. The PERSIST command in SQL "magic" simplifies the process of table creation and writing the data from a `pandas` dataframe into the table



```python
import pandas
chicago_socioeconomic_data = pandas.read_csv('https://data.cityofchicago.org/resource/jcxq-k9xf.csv')
%sql PERSIST chicago_socioeconomic_data
```

     * db2://dvt73383:***@2d46b6b4-cbf6-40eb-bbce-6251e6ba0300.bs2io90l08kqb1od8lcg.databases.appdomain.cloud:32328/BLUDB





    'Persisted chicago_socioeconomic_data'



##### You can verify that the table creation was successful by making a basic query like:



```python
%sql SELECT * FROM chicago_socioeconomic_data limit 5;
```

     * db2://dvt73383:***@2d46b6b4-cbf6-40eb-bbce-6251e6ba0300.bs2io90l08kqb1od8lcg.databases.appdomain.cloud:32328/BLUDB
    Done.





<table>
    <thead>
        <tr>
            <th>index</th>
            <th>ca</th>
            <th>community_area_name</th>
            <th>percent_of_housing_crowded</th>
            <th>percent_households_below_poverty</th>
            <th>percent_aged_16_unemployed</th>
            <th>percent_aged_25_without_high_school_diploma</th>
            <th>percent_aged_under_18_or_over_64</th>
            <th>per_capita_income_</th>
            <th>hardship_index</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>0</td>
            <td>1.0</td>
            <td>Rogers Park</td>
            <td>7.7</td>
            <td>23.6</td>
            <td>8.7</td>
            <td>18.2</td>
            <td>27.5</td>
            <td>23939</td>
            <td>39.0</td>
        </tr>
        <tr>
            <td>1</td>
            <td>2.0</td>
            <td>West Ridge</td>
            <td>7.8</td>
            <td>17.2</td>
            <td>8.8</td>
            <td>20.8</td>
            <td>38.5</td>
            <td>23040</td>
            <td>46.0</td>
        </tr>
        <tr>
            <td>2</td>
            <td>3.0</td>
            <td>Uptown</td>
            <td>3.8</td>
            <td>24.0</td>
            <td>8.9</td>
            <td>11.8</td>
            <td>22.2</td>
            <td>35787</td>
            <td>20.0</td>
        </tr>
        <tr>
            <td>3</td>
            <td>4.0</td>
            <td>Lincoln Square</td>
            <td>3.4</td>
            <td>10.9</td>
            <td>8.2</td>
            <td>13.4</td>
            <td>25.5</td>
            <td>37524</td>
            <td>17.0</td>
        </tr>
        <tr>
            <td>4</td>
            <td>5.0</td>
            <td>North Center</td>
            <td>0.3</td>
            <td>7.5</td>
            <td>5.2</td>
            <td>4.5</td>
            <td>26.2</td>
            <td>57123</td>
            <td>6.0</td>
        </tr>
    </tbody>
</table>



## Problems

### Problem 1

##### How many rows are in the dataset?



```python
%%sql
SELECT COUNT(*) AS COUNT
FROM chicago_socioeconomic_data ;
```

     * db2://dvt73383:***@2d46b6b4-cbf6-40eb-bbce-6251e6ba0300.bs2io90l08kqb1od8lcg.databases.appdomain.cloud:32328/BLUDB
    Done.





<table>
    <thead>
        <tr>
            <th>COUNT</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>78</td>
        </tr>
    </tbody>
</table>



### Problem 2

##### How many community areas in Chicago have a hardship index greater than 50.0?



```python
%%sql

SELECT COUNT(hardship_index) AS COUNT
FROM chicago_socioeconomic_data
WHERE hardship_index > 50.0
```

     * db2://dvt73383:***@2d46b6b4-cbf6-40eb-bbce-6251e6ba0300.bs2io90l08kqb1od8lcg.databases.appdomain.cloud:32328/BLUDB
    Done.





<table>
    <thead>
        <tr>
            <th>COUNT</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>38</td>
        </tr>
    </tbody>
</table>



### Problem 3

##### What is the maximum value of hardship index in this dataset?



```python
%sql SELECT MAX(hardship_index) FROM chicago_socioeconomic_data;
```

     * db2://dvt73383:***@2d46b6b4-cbf6-40eb-bbce-6251e6ba0300.bs2io90l08kqb1od8lcg.databases.appdomain.cloud:32328/BLUDB
    Done.





<table>
    <thead>
        <tr>
            <th>1</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>98.0</td>
        </tr>
    </tbody>
</table>



### Problem 4

##### Which community area which has the highest hardship index?



```python
%%sql
SELECT community_area_name,hardship_index 
FROM chicago_socioeconomic_data
WHERE hardship_index = (SELECT MAX(hardship_index) FROM chicago_socioeconomic_data);
```

     * db2://dvt73383:***@2d46b6b4-cbf6-40eb-bbce-6251e6ba0300.bs2io90l08kqb1od8lcg.databases.appdomain.cloud:32328/BLUDB
    Done.





<table>
    <thead>
        <tr>
            <th>community_area_name</th>
            <th>hardship_index</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Riverdale</td>
            <td>98.0</td>
        </tr>
    </tbody>
</table>



### Problem 5

##### Which Chicago community areas have per-capita incomes greater than $60,000?



```python
%%sql
SELECT community_area_name,hardship_index 
FROM chicago_socioeconomic_data
WHERE per_capita_income_ > 60000;
```

     * db2://dvt73383:***@2d46b6b4-cbf6-40eb-bbce-6251e6ba0300.bs2io90l08kqb1od8lcg.databases.appdomain.cloud:32328/BLUDB
    Done.





<table>
    <thead>
        <tr>
            <th>community_area_name</th>
            <th>hardship_index</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Lake View</td>
            <td>5.0</td>
        </tr>
        <tr>
            <td>Lincoln Park</td>
            <td>2.0</td>
        </tr>
        <tr>
            <td>Near North Side</td>
            <td>1.0</td>
        </tr>
        <tr>
            <td>Loop</td>
            <td>3.0</td>
        </tr>
    </tbody>
</table>



### Problem 6

##### Create a scatter plot using the variables `per_capita_income_` and `hardship_index`. Explain the correlation between the two variables.



```python
import matplotlib.pyplot as plt
%matplotlib inline
import seaborn as sns

income_vs_hardship = %sql SELECT per_capita_income_,hardship_index FROM chicago_socioeconomic_data;

plot = sns.jointplot(x = 'per_capita_income_', y ='hardship_index', data = income_vs_hardship.DataFrame())
```

     * db2://dvt73383:***@2d46b6b4-cbf6-40eb-bbce-6251e6ba0300.bs2io90l08kqb1od8lcg.databases.appdomain.cloud:32328/BLUDB
    Done.



![png](output_21_1.png)



```python
#how per_capita_income_ is related to percent_households_below_poverty
income_vs_poverty = %sql SELECT per_capita_income_,percent_households_below_poverty FROM chicago_socioeconomic_data;

plot = sns.jointplot(x = 'per_capita_income_', y ='percent_households_below_poverty', data = income_vs_poverty.DataFrame())
```

     * db2://dvt73383:***@2d46b6b4-cbf6-40eb-bbce-6251e6ba0300.bs2io90l08kqb1od8lcg.databases.appdomain.cloud:32328/BLUDB
    Done.



![png](output_22_1.png)


### Conclusion

##### Now that you know how to do basic exploratory data analysis using SQL and python visualization tools, you can further explore this dataset to see how the variable `per_capita_income_` is related to `percent_households_below_poverty` and `percent_aged_16_unemployed`. Try to create interesting visualizations!


## Summary

##### In this lab you learned how to store a real world data set from the internet in a database (Db2 on IBM Cloud), gain insights into data using SQL queries. You also visualized a portion of the data in the database to see what story it tells.


## Author

<a href="https://www.linkedin.com/in/ravahuja/?utm_medium=Exinfluencer&utm_source=Exinfluencer&utm_content=000026UJ&utm_term=10006555&utm_id=NA-SkillsNetwork-Channel-SkillsNetworkCoursesIBMDeveloperSkillsNetworkDB0201ENSkillsNetwork20127838-2021-01-01" target="_blank">Rav Ahuja</a>

## Change Log

| Date (YYYY-MM-DD) | Version | Changed By    | Change Description                 |
| ----------------- | ------- | ------------- | ---------------------------------- |
| 2021-07-09        | 2.2     | Malika        | Updated connection string          |
| 2021-05-06        | 2.1     | Malika Singla | Added libraries                    |
| 2020-08-28        | 2.0     | Lavanya       | Moved lab to course repo in GitLab |

<hr>

## <h3 align="center"> © IBM Corporation 2020. All rights reserved. <h3/>

