<center>
    <img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DV0101EN-SkillsNetwork/labs/Module%202/images/IDSNlogo.png" width="300" alt="cognitiveclass.ai logo"  />
</center>

# Area Plots, Histograms, and Bar Plots

Estimated time needed: **30** minutes

## Objectives

After completing this lab you will be able to:

*   Create additional labs namely area plots, histogram and bar charts


## Table of Contents

<div class="alert alert-block alert-info" style="margin-top: 20px">

1.  [Exploring Datasets with *pandas*](#0)<br>
2.  [Downloading and Prepping Data](#2)<br>
3.  [Visualizing Data using Matplotlib](#4) <br>
4.  [Area Plots](#6) <br>
5.  [Histograms](#8) <br>
6.  [Bar Charts](#10) <br>

</div>


# Exploring Datasets with *pandas* and Matplotlib<a id="0"></a>

Toolkits: The course heavily relies on [**pandas**](http://pandas.pydata.org/?utm_medium=Exinfluencer&utm_source=Exinfluencer&utm_content=000026UJ&utm_term=10006555&utm_id=NA-SkillsNetwork-Channel-SkillsNetworkCoursesIBMDeveloperSkillsNetworkDV0101ENSkillsNetwork20297740-2021-01-01) and [**Numpy**](http://www.numpy.org/?utm_medium=Exinfluencer&utm_source=Exinfluencer&utm_content=000026UJ&utm_term=10006555&utm_id=NA-SkillsNetwork-Channel-SkillsNetworkCoursesIBMDeveloperSkillsNetworkDV0101ENSkillsNetwork20297740-2021-01-01) for data wrangling, analysis, and visualization. The primary plotting library that we are exploring in the course is [Matplotlib](http://matplotlib.org/?utm_medium=Exinfluencer&utm_source=Exinfluencer&utm_content=000026UJ&utm_term=10006555&utm_id=NA-SkillsNetwork-Channel-SkillsNetworkCoursesIBMDeveloperSkillsNetworkDV0101ENSkillsNetwork20297740-2021-01-01).

Dataset: Immigration to Canada from 1980 to 2013 - [International migration flows to and from selected countries - The 2015 revision](http://www.un.org/en/development/desa/population/migration/data/empirical2/migrationflows.shtml?utm_medium=Exinfluencer&utm_source=Exinfluencer&utm_content=000026UJ&utm_term=10006555&utm_id=NA-SkillsNetwork-Channel-SkillsNetworkCoursesIBMDeveloperSkillsNetworkDV0101ENSkillsNetwork20297740-2021-01-01) from United Nation's website.

The dataset contains annual data on the flows of international migrants as recorded by the countries of destination. The data presents both inflows and outflows according to the place of birth, citizenship or place of previous / next residence both for foreigners and nationals. For this lesson, we will focus on the Canadian Immigration data.


# Downloading and Prepping Data <a id="2"></a>


The first thing we'll do is install **openpyxl** (formerly **xlrd**), a module that *pandas* requires to read Excel files.



```python
#!mamba install openpyxl==3.0.9 -y
```

Import Primary Modules. The first thing we'll do is import two key data analysis modules: `pandas` and `numpy`.



```python
import numpy as np  # useful for many scientific computing in Python
import pandas as pd # primary data structure library
```

Download the Canadian Immigration dataset and read it into a *pandas* dataframe.



```python
df_can = pd.read_excel(
    'https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DV0101EN-SkillsNetwork/Data%20Files/Canada.xlsx',
    sheet_name='Canada by Citizenship',
    skiprows=range(20),
    skipfooter=2)
print('Data downloaded and read into a dataframe!')
```

    Data downloaded and read into a dataframe!


Let's take a look at the first five items in our dataset.



```python
df_can.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Type</th>
      <th>Coverage</th>
      <th>OdName</th>
      <th>AREA</th>
      <th>AreaName</th>
      <th>REG</th>
      <th>RegName</th>
      <th>DEV</th>
      <th>DevName</th>
      <th>1980</th>
      <th>...</th>
      <th>2012</th>
      <th>2013</th>
      <th>Unnamed: 43</th>
      <th>Unnamed: 44</th>
      <th>Unnamed: 45</th>
      <th>Unnamed: 46</th>
      <th>Unnamed: 47</th>
      <th>Unnamed: 48</th>
      <th>Unnamed: 49</th>
      <th>Unnamed: 50</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Immigrants</td>
      <td>Foreigners</td>
      <td>Afghanistan</td>
      <td>935</td>
      <td>Asia</td>
      <td>5501</td>
      <td>Southern Asia</td>
      <td>902</td>
      <td>Developing regions</td>
      <td>16</td>
      <td>...</td>
      <td>2635</td>
      <td>2004</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Immigrants</td>
      <td>Foreigners</td>
      <td>Albania</td>
      <td>908</td>
      <td>Europe</td>
      <td>925</td>
      <td>Southern Europe</td>
      <td>901</td>
      <td>Developed regions</td>
      <td>1</td>
      <td>...</td>
      <td>620</td>
      <td>603</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Immigrants</td>
      <td>Foreigners</td>
      <td>Algeria</td>
      <td>903</td>
      <td>Africa</td>
      <td>912</td>
      <td>Northern Africa</td>
      <td>902</td>
      <td>Developing regions</td>
      <td>80</td>
      <td>...</td>
      <td>3774</td>
      <td>4331</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Immigrants</td>
      <td>Foreigners</td>
      <td>American Samoa</td>
      <td>909</td>
      <td>Oceania</td>
      <td>957</td>
      <td>Polynesia</td>
      <td>902</td>
      <td>Developing regions</td>
      <td>0</td>
      <td>...</td>
      <td>0</td>
      <td>0</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Immigrants</td>
      <td>Foreigners</td>
      <td>Andorra</td>
      <td>908</td>
      <td>Europe</td>
      <td>925</td>
      <td>Southern Europe</td>
      <td>901</td>
      <td>Developed regions</td>
      <td>0</td>
      <td>...</td>
      <td>1</td>
      <td>1</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
  </tbody>
</table>
<p>5 rows × 51 columns</p>
</div>



Let's find out how many entries there are in our dataset.



```python
# print the dimensions of the dataframe
print(df_can.shape)
```

    (195, 51)


Clean up data. We will make some modifications to the original dataset to make it easier to create our visualizations. Refer to `Introduction to Matplotlib and Line Plots` lab for the rational and detailed description of the changes.


#### 1. Clean up the dataset to remove columns that are not informative to us for visualization (eg. Type, AREA, REG).



```python
#Remove Unnamed Columns
df_can = df_can.loc[:,:2013]
```


```python
df_can.drop(['AREA', 'REG', 'DEV', 'Type', 'Coverage'], axis=1, inplace=True)

# let's view the first five elements and see how the dataframe was changed
df_can.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>OdName</th>
      <th>AreaName</th>
      <th>RegName</th>
      <th>DevName</th>
      <th>1980</th>
      <th>1981</th>
      <th>1982</th>
      <th>1983</th>
      <th>1984</th>
      <th>1985</th>
      <th>...</th>
      <th>2004</th>
      <th>2005</th>
      <th>2006</th>
      <th>2007</th>
      <th>2008</th>
      <th>2009</th>
      <th>2010</th>
      <th>2011</th>
      <th>2012</th>
      <th>2013</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Afghanistan</td>
      <td>Asia</td>
      <td>Southern Asia</td>
      <td>Developing regions</td>
      <td>16</td>
      <td>39</td>
      <td>39</td>
      <td>47</td>
      <td>71</td>
      <td>340</td>
      <td>...</td>
      <td>2978</td>
      <td>3436</td>
      <td>3009</td>
      <td>2652</td>
      <td>2111</td>
      <td>1746</td>
      <td>1758</td>
      <td>2203</td>
      <td>2635</td>
      <td>2004</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Albania</td>
      <td>Europe</td>
      <td>Southern Europe</td>
      <td>Developed regions</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>...</td>
      <td>1450</td>
      <td>1223</td>
      <td>856</td>
      <td>702</td>
      <td>560</td>
      <td>716</td>
      <td>561</td>
      <td>539</td>
      <td>620</td>
      <td>603</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Algeria</td>
      <td>Africa</td>
      <td>Northern Africa</td>
      <td>Developing regions</td>
      <td>80</td>
      <td>67</td>
      <td>71</td>
      <td>69</td>
      <td>63</td>
      <td>44</td>
      <td>...</td>
      <td>3616</td>
      <td>3626</td>
      <td>4807</td>
      <td>3623</td>
      <td>4005</td>
      <td>5393</td>
      <td>4752</td>
      <td>4325</td>
      <td>3774</td>
      <td>4331</td>
    </tr>
    <tr>
      <th>3</th>
      <td>American Samoa</td>
      <td>Oceania</td>
      <td>Polynesia</td>
      <td>Developing regions</td>
      <td>0</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>...</td>
      <td>0</td>
      <td>0</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Andorra</td>
      <td>Europe</td>
      <td>Southern Europe</td>
      <td>Developed regions</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>...</td>
      <td>0</td>
      <td>0</td>
      <td>1</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>1</td>
      <td>1</td>
    </tr>
  </tbody>
</table>
<p>5 rows × 38 columns</p>
</div>



Notice how the columns Type, Coverage, AREA, REG, and DEV got removed from the dataframe.


#### 2. Rename some of the columns so that they make sense.



```python
df_can.rename(columns={'OdName':'Country', 'AreaName':'Continent','RegName':'Region'}, inplace=True)

# let's view the first five elements and see how the dataframe was changed
df_can.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Country</th>
      <th>Continent</th>
      <th>Region</th>
      <th>DevName</th>
      <th>1980</th>
      <th>1981</th>
      <th>1982</th>
      <th>1983</th>
      <th>1984</th>
      <th>1985</th>
      <th>...</th>
      <th>2004</th>
      <th>2005</th>
      <th>2006</th>
      <th>2007</th>
      <th>2008</th>
      <th>2009</th>
      <th>2010</th>
      <th>2011</th>
      <th>2012</th>
      <th>2013</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Afghanistan</td>
      <td>Asia</td>
      <td>Southern Asia</td>
      <td>Developing regions</td>
      <td>16</td>
      <td>39</td>
      <td>39</td>
      <td>47</td>
      <td>71</td>
      <td>340</td>
      <td>...</td>
      <td>2978</td>
      <td>3436</td>
      <td>3009</td>
      <td>2652</td>
      <td>2111</td>
      <td>1746</td>
      <td>1758</td>
      <td>2203</td>
      <td>2635</td>
      <td>2004</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Albania</td>
      <td>Europe</td>
      <td>Southern Europe</td>
      <td>Developed regions</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>...</td>
      <td>1450</td>
      <td>1223</td>
      <td>856</td>
      <td>702</td>
      <td>560</td>
      <td>716</td>
      <td>561</td>
      <td>539</td>
      <td>620</td>
      <td>603</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Algeria</td>
      <td>Africa</td>
      <td>Northern Africa</td>
      <td>Developing regions</td>
      <td>80</td>
      <td>67</td>
      <td>71</td>
      <td>69</td>
      <td>63</td>
      <td>44</td>
      <td>...</td>
      <td>3616</td>
      <td>3626</td>
      <td>4807</td>
      <td>3623</td>
      <td>4005</td>
      <td>5393</td>
      <td>4752</td>
      <td>4325</td>
      <td>3774</td>
      <td>4331</td>
    </tr>
    <tr>
      <th>3</th>
      <td>American Samoa</td>
      <td>Oceania</td>
      <td>Polynesia</td>
      <td>Developing regions</td>
      <td>0</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>...</td>
      <td>0</td>
      <td>0</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Andorra</td>
      <td>Europe</td>
      <td>Southern Europe</td>
      <td>Developed regions</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>...</td>
      <td>0</td>
      <td>0</td>
      <td>1</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>1</td>
      <td>1</td>
    </tr>
  </tbody>
</table>
<p>5 rows × 38 columns</p>
</div>



Notice how the column names now make much more sense, even to an outsider.


#### 3. For consistency, ensure that all column labels of type string.



```python
# let's examine the types of the column labels
all(isinstance(column, str) for column in df_can.columns)

```




    False



Notice how the above line of code returned *False* when we tested if all the column labels are of type **string**. So let's change them all to **string** type.



```python
df_can.columns = list(map(str, df_can.columns))

# let's check the column labels types now
all(isinstance(column, str) for column in df_can.columns)
```




    True



#### 4. Set the country name as index - useful for quickly looking up countries using .loc method.



```python
df_can.set_index('Country', inplace=True)

# Let's view the first five elements and see how the dataframe was changed
df_can.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Continent</th>
      <th>Region</th>
      <th>DevName</th>
      <th>1980</th>
      <th>1981</th>
      <th>1982</th>
      <th>1983</th>
      <th>1984</th>
      <th>1985</th>
      <th>1986</th>
      <th>...</th>
      <th>2004</th>
      <th>2005</th>
      <th>2006</th>
      <th>2007</th>
      <th>2008</th>
      <th>2009</th>
      <th>2010</th>
      <th>2011</th>
      <th>2012</th>
      <th>2013</th>
    </tr>
    <tr>
      <th>Country</th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Afghanistan</th>
      <td>Asia</td>
      <td>Southern Asia</td>
      <td>Developing regions</td>
      <td>16</td>
      <td>39</td>
      <td>39</td>
      <td>47</td>
      <td>71</td>
      <td>340</td>
      <td>496</td>
      <td>...</td>
      <td>2978</td>
      <td>3436</td>
      <td>3009</td>
      <td>2652</td>
      <td>2111</td>
      <td>1746</td>
      <td>1758</td>
      <td>2203</td>
      <td>2635</td>
      <td>2004</td>
    </tr>
    <tr>
      <th>Albania</th>
      <td>Europe</td>
      <td>Southern Europe</td>
      <td>Developed regions</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>1</td>
      <td>...</td>
      <td>1450</td>
      <td>1223</td>
      <td>856</td>
      <td>702</td>
      <td>560</td>
      <td>716</td>
      <td>561</td>
      <td>539</td>
      <td>620</td>
      <td>603</td>
    </tr>
    <tr>
      <th>Algeria</th>
      <td>Africa</td>
      <td>Northern Africa</td>
      <td>Developing regions</td>
      <td>80</td>
      <td>67</td>
      <td>71</td>
      <td>69</td>
      <td>63</td>
      <td>44</td>
      <td>69</td>
      <td>...</td>
      <td>3616</td>
      <td>3626</td>
      <td>4807</td>
      <td>3623</td>
      <td>4005</td>
      <td>5393</td>
      <td>4752</td>
      <td>4325</td>
      <td>3774</td>
      <td>4331</td>
    </tr>
    <tr>
      <th>American Samoa</th>
      <td>Oceania</td>
      <td>Polynesia</td>
      <td>Developing regions</td>
      <td>0</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>...</td>
      <td>0</td>
      <td>0</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>Andorra</th>
      <td>Europe</td>
      <td>Southern Europe</td>
      <td>Developed regions</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>2</td>
      <td>...</td>
      <td>0</td>
      <td>0</td>
      <td>1</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>1</td>
      <td>1</td>
    </tr>
  </tbody>
</table>
<p>5 rows × 37 columns</p>
</div>



Notice now the country names now serve as indices.


#### 5. Add total column.



```python
#Drop Total if Total already exists
#df_can.drop(columns=['Total'],inplace=True)
```


```python
df_can['Total'] = df_can.sum(axis=1)

# let's view the first five elements and see how the dataframe was changed
df_can.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Continent</th>
      <th>Region</th>
      <th>DevName</th>
      <th>1980</th>
      <th>1981</th>
      <th>1982</th>
      <th>1983</th>
      <th>1984</th>
      <th>1985</th>
      <th>1986</th>
      <th>...</th>
      <th>2005</th>
      <th>2006</th>
      <th>2007</th>
      <th>2008</th>
      <th>2009</th>
      <th>2010</th>
      <th>2011</th>
      <th>2012</th>
      <th>2013</th>
      <th>Total</th>
    </tr>
    <tr>
      <th>Country</th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Afghanistan</th>
      <td>Asia</td>
      <td>Southern Asia</td>
      <td>Developing regions</td>
      <td>16</td>
      <td>39</td>
      <td>39</td>
      <td>47</td>
      <td>71</td>
      <td>340</td>
      <td>496</td>
      <td>...</td>
      <td>3436</td>
      <td>3009</td>
      <td>2652</td>
      <td>2111</td>
      <td>1746</td>
      <td>1758</td>
      <td>2203</td>
      <td>2635</td>
      <td>2004</td>
      <td>58639</td>
    </tr>
    <tr>
      <th>Albania</th>
      <td>Europe</td>
      <td>Southern Europe</td>
      <td>Developed regions</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>1</td>
      <td>...</td>
      <td>1223</td>
      <td>856</td>
      <td>702</td>
      <td>560</td>
      <td>716</td>
      <td>561</td>
      <td>539</td>
      <td>620</td>
      <td>603</td>
      <td>15699</td>
    </tr>
    <tr>
      <th>Algeria</th>
      <td>Africa</td>
      <td>Northern Africa</td>
      <td>Developing regions</td>
      <td>80</td>
      <td>67</td>
      <td>71</td>
      <td>69</td>
      <td>63</td>
      <td>44</td>
      <td>69</td>
      <td>...</td>
      <td>3626</td>
      <td>4807</td>
      <td>3623</td>
      <td>4005</td>
      <td>5393</td>
      <td>4752</td>
      <td>4325</td>
      <td>3774</td>
      <td>4331</td>
      <td>69439</td>
    </tr>
    <tr>
      <th>American Samoa</th>
      <td>Oceania</td>
      <td>Polynesia</td>
      <td>Developing regions</td>
      <td>0</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>...</td>
      <td>0</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>6</td>
    </tr>
    <tr>
      <th>Andorra</th>
      <td>Europe</td>
      <td>Southern Europe</td>
      <td>Developed regions</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>2</td>
      <td>...</td>
      <td>0</td>
      <td>1</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>1</td>
      <td>1</td>
      <td>15</td>
    </tr>
  </tbody>
</table>
<p>5 rows × 38 columns</p>
</div>



Now the dataframe has an extra column that presents the total number of immigrants from each country in the dataset from 1980 - 2013. So if we print the dimension of the data, we get:



```python
print('data dimensions:', df_can.shape)
```

    data dimensions: (195, 38)


So now our dataframe has 38 columns instead of 37 columns that we had before.



```python
# finally, let's create a list of years from 1980 - 2013
# this will come in handy when we start plotting the data
years = list(map(str, range(1980, 2014)))

years
```




    ['1980',
     '1981',
     '1982',
     '1983',
     '1984',
     '1985',
     '1986',
     '1987',
     '1988',
     '1989',
     '1990',
     '1991',
     '1992',
     '1993',
     '1994',
     '1995',
     '1996',
     '1997',
     '1998',
     '1999',
     '2000',
     '2001',
     '2002',
     '2003',
     '2004',
     '2005',
     '2006',
     '2007',
     '2008',
     '2009',
     '2010',
     '2011',
     '2012',
     '2013']



# Visualizing Data using Matplotlib<a id="4"></a>


Import the `matplotlib` library.



```python
# use the inline backend to generate the plots within the browser
%matplotlib inline

import matplotlib as mpl
import matplotlib.pyplot as plt

mpl.style.use('ggplot')  # optional: for ggplot-like style

# check for latest version of Matplotlib
print('Matplotlib version: ', mpl.__version__) # >= 2.0.0
```

    Matplotlib version:  3.3.4


# Area Plots<a id="6"></a>


In the last module, we created a line plot that visualized the top 5 countries that contribued the most immigrants to Canada from 1980 to 2013. With a little modification to the code, we can visualize this plot as a cumulative plot, also knows as a **Stacked Line Plot** or **Area plot**.



```python
df_can.sort_values(['Total'], ascending=False, axis=0, inplace=True)

# get the top 5 entries
df_top5 = df_can.head()

# transpose the dataframe
df_top5 = df_top5[years].transpose()

df_top5.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th>Country</th>
      <th>India</th>
      <th>China</th>
      <th>United Kingdom of Great Britain and Northern Ireland</th>
      <th>Philippines</th>
      <th>Pakistan</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>1980</th>
      <td>8880</td>
      <td>5123</td>
      <td>22045</td>
      <td>6051</td>
      <td>978</td>
    </tr>
    <tr>
      <th>1981</th>
      <td>8670</td>
      <td>6682</td>
      <td>24796</td>
      <td>5921</td>
      <td>972</td>
    </tr>
    <tr>
      <th>1982</th>
      <td>8147</td>
      <td>3308</td>
      <td>20620</td>
      <td>5249</td>
      <td>1201</td>
    </tr>
    <tr>
      <th>1983</th>
      <td>7338</td>
      <td>1863</td>
      <td>10015</td>
      <td>4562</td>
      <td>900</td>
    </tr>
    <tr>
      <th>1984</th>
      <td>5704</td>
      <td>1527</td>
      <td>10170</td>
      <td>3801</td>
      <td>668</td>
    </tr>
  </tbody>
</table>
</div>



Area plots are stacked by default. And to produce a stacked area plot, each column must be either all positive or all negative values (any `NaN`, i.e. not a number, values will default to 0). To produce an unstacked plot, set parameter `stacked` to value `False`.



```python
# let's change the index values of df_top5 to type integer for plotting
df_top5.index = df_top5.index.map(int)
df_top5.plot(kind='area',
             stacked=False,
             figsize=(20, 10))  # pass a tuple (x, y) size

plt.title('Immigration Trend of Top 5 Countries')
plt.ylabel('Number of Immigrants')
plt.xlabel('Years')

plt.show()
```


![png](output_43_0.png)


The unstacked plot has a default transparency (alpha value) at 0.5. We can modify this value by passing in the `alpha` parameter.



```python
df_top5.plot(kind='area', 
             alpha=0.25,  # 0 - 1, default value alpha = 0.5
             stacked=False,
             figsize=(20, 10))

plt.title('Immigration Trend of Top 5 Countries')
plt.ylabel('Number of Immigrants')
plt.xlabel('Years')

plt.show()
```


![png](output_45_0.png)


### Two types of plotting

As we discussed in the video lectures, there are two styles/options of plotting with `matplotlib`， plotting using the Artist layer and plotting using the scripting layer.

\*\*Option 1: Scripting layer (procedural method) - using matplotlib.pyplot as 'plt' \*\*

You can use `plt` i.e. `matplotlib.pyplot` and add more elements by calling different methods procedurally; for example, `plt.title(...)` to add title or `plt.xlabel(...)` to add label to the x-axis.

```python
    # Option 1: This is what we have been using so far
    df_top5.plot(kind='area', alpha=0.35, figsize=(20, 10)) 
    plt.title('Immigration trend of top 5 countries')
    plt.ylabel('Number of immigrants')
    plt.xlabel('Years')
```


\*\*Option 2: Artist layer (Object oriented method) - using an `Axes` instance from Matplotlib (preferred)\*\*

You can use an `Axes` instance of your current plot and store it in a variable (eg. `ax`). You can add more elements by calling methods with a little change in syntax (by adding "`set_`" to the previous methods). For example, use `ax.set_title()` instead of `plt.title()` to add title,  or `ax.set_xlabel()` instead of `plt.xlabel()` to add label to the x-axis.

This option sometimes is more transparent and flexible to use for advanced plots (in particular when having multiple plots, as you will see later).

In this course, we will stick to the **scripting layer**, except for some advanced visualizations where we will need to use the **artist layer** to manipulate advanced aspects of the plots.



```python
# option 2: preferred option with more flexibility
ax = df_top5.plot(kind='area', alpha=0.35, figsize=(20, 10),stacked = False)

ax.set_title('Immigration Trend of Top 5 Countries')
ax.set_ylabel('Number of Immigrants')
ax.set_xlabel('Years')
```




    Text(0.5, 0, 'Years')




![png](output_48_1.png)


**Question**: Use the scripting layer to create a stacked area plot of the 5 countries that contributed the least to immigration to Canada **from** 1980 to 2013. Use a transparency value of 0.45.



```python
### type your answer here
df_least5 = df_can.tail()
df_least5 = df_least5[years].transpose()
df_least5.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th>Country</th>
      <th>San Marino</th>
      <th>New Caledonia</th>
      <th>Marshall Islands</th>
      <th>Western Sahara</th>
      <th>Palau</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>1980</th>
      <td>1</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>1981</th>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>1982</th>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>1983</th>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>1984</th>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
    </tr>
  </tbody>
</table>
</div>




```python
#Map index to integer
df_least5.index = df_least5.index.map(int)

#Plot
df_least5.plot(kind = 'area',
                alpha = 0.45,
                figsize = (20,10))

plt.title('Immigration Trend of 5 Countries with least contribution to immigration')
plt.ylabel('Number of Immigrants')
plt.xlabel('Years')

plt.show()

        
```


![png](output_51_0.png)


**Question**: Use the artist layer to create an unstacked area plot of the 5 countries that contributed the least to immigration to Canada **from** 1980 to 2013. Use a transparency value of 0.55.



```python
### type your answer here
ax = df_least5.plot(kind = 'area', stacked = False, figsize = (20,10), alpha = 0.55)

ax.set_title('Immigration Trend of 5 Countries with least contribution to immigration')
ax.set_ylabel('Number of Immigrants')
ax.set_xlabel('Years')

```




    Text(0.5, 0, 'Years')




![png](output_53_1.png)


# Histograms<a id="8"></a>

A histogram is a way of representing the *frequency* distribution of numeric dataset. The way it works is it partitions the x-axis into *bins*, assigns each data point in our dataset to a bin, and then counts the number of data points that have been assigned to each bin. So the y-axis is the frequency or the number of data points in each bin. Note that we can change the bin size and usually one needs to tweak it so that the distribution is displayed nicely.


**Question:** What is the frequency distribution of the number (population) of new immigrants from the various countries to Canada in 2013?


Before we proceed with creating the histogram plot, let's first examine the data split into intervals. To do this, we will us **Numpy**'s `histrogram` method to get the bin ranges and frequency counts as follows:



```python
# let's quickly view the 2013 data
df_can['2013'].head()
```




    Country
    India                                                   33087
    China                                                   34129
    United Kingdom of Great Britain and Northern Ireland     5827
    Philippines                                             29544
    Pakistan                                                12603
    Name: 2013, dtype: int64




```python
# np.histogram returns 2 values
count, bin_edges = np.histogram(df_can['2013'])

print(count) # frequency count
print(bin_edges) # bin ranges, default = 10 bins
```

    [178  11   1   2   0   0   0   0   1   2]
    [    0.   3412.9  6825.8 10238.7 13651.6 17064.5 20477.4 23890.3 27303.2
     30716.1 34129. ]


By default, the `histrogram` method breaks up the dataset into 10 bins. The figure below summarizes the bin ranges and the frequency distribution of immigration in 2013. We can see that in 2013:

*   178 countries contributed between 0 to 3412.9 immigrants
*   11 countries contributed between 3412.9 to 6825.8 immigrants
*   1 country contributed between 6285.8 to 10238.7 immigrants, and so on..

<img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DV0101EN-SkillsNetwork/labs/Module%202/images/Mod2Fig1-Histogram.jpg" align="center" width=800>


We can easily graph this distribution by passing `kind=hist` to `plot()`.



```python
df_can['2013'].plot(kind='hist', figsize=(20, 10))

# add a title to the histogram
plt.title('Histogram of Immigration from 195 Countries in 2013')
# add y-label
plt.ylabel('Number of Countries')
# add x-label
plt.xlabel('Number of Immigrants')

plt.show()
```


![png](output_61_0.png)


In the above plot, the x-axis represents the population range of immigrants in intervals of 3412.9. The y-axis represents the number of countries that contributed to the aforementioned population.

Notice that the x-axis labels do not match with the bin size. This can be fixed by passing in a `xticks` keyword that contains the list of the bin sizes, as follows:



```python
# 'bin_edges' is a list of bin intervals
count, bin_edges = np.histogram(df_can['2013'])

df_can['2013'].plot(kind='hist', figsize=(8, 5), xticks=bin_edges)

plt.title('Histogram of Immigration from 195 countries in 2013') # add a title to the histogram
plt.ylabel('Number of Countries') # add y-label
plt.xlabel('Number of Immigrants') # add x-label

plt.show()
```


![png](output_63_0.png)


*Side Note:* We could use `df_can['2013'].plot.hist()`, instead. In fact, throughout this lesson, using `some_data.plot(kind='type_plot', ...)` is equivalent to `some_data.plot.type_plot(...)`. That is, passing the type of the plot as argument or method behaves the same.

See the *pandas* documentation for more info  [http://pandas.pydata.org/pandas-docs/stable/generated/pandas.Series.plot.html](http://pandas.pydata.org/pandas-docs/stable/generated/pandas.Series.plot.html?utm_medium=Exinfluencer&utm_source=Exinfluencer&utm_content=000026UJ&utm_term=10006555&utm_id=NA-SkillsNetwork-Channel-SkillsNetworkCoursesIBMDeveloperSkillsNetworkDV0101ENSkillsNetwork20297740-2021-01-01).


We can also plot multiple histograms on the same plot. For example, let's try to answer the following questions using a histogram.

**Question**: What is the immigration distribution for Denmark, Norway, and Sweden for years 1980 - 2013?



```python
# let's quickly view the dataset 
df_can.loc[['Denmark', 'Norway', 'Sweden'], years]
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>1980</th>
      <th>1981</th>
      <th>1982</th>
      <th>1983</th>
      <th>1984</th>
      <th>1985</th>
      <th>1986</th>
      <th>1987</th>
      <th>1988</th>
      <th>1989</th>
      <th>...</th>
      <th>2004</th>
      <th>2005</th>
      <th>2006</th>
      <th>2007</th>
      <th>2008</th>
      <th>2009</th>
      <th>2010</th>
      <th>2011</th>
      <th>2012</th>
      <th>2013</th>
    </tr>
    <tr>
      <th>Country</th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Denmark</th>
      <td>272</td>
      <td>293</td>
      <td>299</td>
      <td>106</td>
      <td>93</td>
      <td>73</td>
      <td>93</td>
      <td>109</td>
      <td>129</td>
      <td>129</td>
      <td>...</td>
      <td>89</td>
      <td>62</td>
      <td>101</td>
      <td>97</td>
      <td>108</td>
      <td>81</td>
      <td>92</td>
      <td>93</td>
      <td>94</td>
      <td>81</td>
    </tr>
    <tr>
      <th>Norway</th>
      <td>116</td>
      <td>77</td>
      <td>106</td>
      <td>51</td>
      <td>31</td>
      <td>54</td>
      <td>56</td>
      <td>80</td>
      <td>73</td>
      <td>76</td>
      <td>...</td>
      <td>73</td>
      <td>57</td>
      <td>53</td>
      <td>73</td>
      <td>66</td>
      <td>75</td>
      <td>46</td>
      <td>49</td>
      <td>53</td>
      <td>59</td>
    </tr>
    <tr>
      <th>Sweden</th>
      <td>281</td>
      <td>308</td>
      <td>222</td>
      <td>176</td>
      <td>128</td>
      <td>158</td>
      <td>187</td>
      <td>198</td>
      <td>171</td>
      <td>182</td>
      <td>...</td>
      <td>129</td>
      <td>205</td>
      <td>139</td>
      <td>193</td>
      <td>165</td>
      <td>167</td>
      <td>159</td>
      <td>134</td>
      <td>140</td>
      <td>140</td>
    </tr>
  </tbody>
</table>
<p>3 rows × 34 columns</p>
</div>




```python
# generate histogram
df_can.loc[['Denmark', 'Norway', 'Sweden'], years].plot.hist()
```




    <AxesSubplot:ylabel='Frequency'>




![png](output_67_1.png)


That does not look right!

Don't worry, you'll often come across situations like this when creating plots. The solution often lies in how the underlying dataset is structured.

Instead of plotting the population frequency distribution of the population for the 3 countries, *pandas* instead plotted the population frequency distribution for the `years`.

This can be easily fixed by first transposing the dataset, and then plotting as shown below.



```python
# transpose dataframe
df_t = df_can.loc[['Denmark', 'Norway', 'Sweden'], years].transpose()
df_t.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th>Country</th>
      <th>Denmark</th>
      <th>Norway</th>
      <th>Sweden</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>1980</th>
      <td>272</td>
      <td>116</td>
      <td>281</td>
    </tr>
    <tr>
      <th>1981</th>
      <td>293</td>
      <td>77</td>
      <td>308</td>
    </tr>
    <tr>
      <th>1982</th>
      <td>299</td>
      <td>106</td>
      <td>222</td>
    </tr>
    <tr>
      <th>1983</th>
      <td>106</td>
      <td>51</td>
      <td>176</td>
    </tr>
    <tr>
      <th>1984</th>
      <td>93</td>
      <td>31</td>
      <td>128</td>
    </tr>
  </tbody>
</table>
</div>




```python
# generate histogram
df_t.plot(kind='hist', figsize=(10, 6))

plt.title('Histogram of Immigration from Denmark, Norway, and Sweden from 1980 - 2013')
plt.ylabel('Number of Years')
plt.xlabel('Number of Immigrants')

plt.show()
```


![png](output_70_0.png)


Let's make a few modifications to improve the impact and aesthetics of the previous plot:

*   increase the bin size to 15 by passing in `bins` parameter;
*   set transparency to 60% by passing in `alpha` parameter;
*   label the x-axis by passing in `x-label` parameter;
*   change the colors of the plots by passing in `color` parameter.



```python
# let's get the x-tick values
count, bin_edges = np.histogram(df_t, 15)

# un-stacked histogram
df_t.plot(kind ='hist', 
          figsize=(10, 6),
          bins=15,
          alpha=0.6,
          xticks=bin_edges,
          color=['coral', 'darkslateblue', 'mediumseagreen']
         )

plt.title('Histogram of Immigration from Denmark, Norway, and Sweden from 1980 - 2013')
plt.ylabel('Number of Years')
plt.xlabel('Number of Immigrants')

plt.show()
```


![png](output_72_0.png)


Tip:
For a full listing of colors available in Matplotlib, run the following code in your python shell:

```python
import matplotlib
for name, hex in matplotlib.colors.cnames.items():
    print(name, hex)
```


If we do not want the plots to overlap each other, we can stack them using the `stacked` parameter. Let's also adjust the min and max x-axis labels to remove the extra gap on the edges of the plot. We can pass a tuple (min,max) using the `xlim` paramater, as show below.



```python
count, bin_edges = np.histogram(df_t, 15)
xmin = bin_edges[0] - 10   #  first bin value is 31.0, adding buffer of 10 for aesthetic purposes 
xmax = bin_edges[-1] + 10  #  last bin value is 308.0, adding buffer of 10 for aesthetic purposes

# stacked Histogram
df_t.plot(kind='hist',
          figsize=(10, 6), 
          bins=15,
          xticks=bin_edges,
          color=['coral', 'darkslateblue', 'mediumseagreen'],
          stacked=True,
          xlim=(xmin, xmax)
         )

plt.title('Histogram of Immigration from Denmark, Norway, and Sweden from 1980 - 2013')
plt.ylabel('Number of Years')
plt.xlabel('Number of Immigrants') 

plt.show()
```


![png](output_75_0.png)


**Question**: Use the scripting layer to display the immigration distribution for Greece, Albania, and Bulgaria for years 1980 - 2013? Use an overlapping plot with 15 bins and a transparency value of 0.35.



```python
### Filtered Dataset for the plot
df_hist = df_can.loc[['Greece','Albania','Bulgaria'],years].transpose()
df_hist.head()

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th>Country</th>
      <th>Greece</th>
      <th>Albania</th>
      <th>Bulgaria</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>1980</th>
      <td>1065</td>
      <td>1</td>
      <td>24</td>
    </tr>
    <tr>
      <th>1981</th>
      <td>953</td>
      <td>0</td>
      <td>20</td>
    </tr>
    <tr>
      <th>1982</th>
      <td>897</td>
      <td>0</td>
      <td>12</td>
    </tr>
    <tr>
      <th>1983</th>
      <td>633</td>
      <td>0</td>
      <td>33</td>
    </tr>
    <tr>
      <th>1984</th>
      <td>580</td>
      <td>0</td>
      <td>11</td>
    </tr>
  </tbody>
</table>
</div>




```python
#Get count and bin edges
count ,bin_edges = np.histogram(df_hist,15)

#plot
df_hist.plot.hist(xticks = bin_edges, stacked = False,
                    bins = 15, figsize = (20,10),
                    alpha = 0.35)


plt.title('Histogram of Immigration from Greece, Albania, Bulgaria from 1980 - 2013')
plt.ylabel('Number of Years')
plt.xlabel('Number of Immigrants')


plt.show()
```


![png](output_78_0.png)


# Bar Charts (Dataframe) <a id="10"></a>

A bar plot is a way of representing data where the *length* of the bars represents the magnitude/size of the feature/variable. Bar graphs usually represent numerical and categorical variables grouped in intervals.

To create a bar plot, we can pass one of two arguments via `kind` parameter in `plot()`:

*   `kind=bar` creates a *vertical* bar plot
*   `kind=barh` creates a *horizontal* bar plot


**Vertical bar plot**

In vertical bar graphs, the x-axis is used for labelling, and the length of bars on the y-axis corresponds to the magnitude of the variable being measured. Vertical bar graphs are particularly useful in analyzing time series data. One disadvantage is that they lack space for text labelling at the foot of each bar.

**Let's start off by analyzing the effect of Iceland's Financial Crisis:**

The 2008 - 2011 Icelandic Financial Crisis was a major economic and political event in Iceland. Relative to the size of its economy, Iceland's systemic banking collapse was the largest experienced by any country in economic history. The crisis led to a severe economic depression in 2008 - 2011 and significant political unrest.

**Question:** Let's compare the number of Icelandic immigrants (country = 'Iceland') to Canada from year 1980 to 2013.



```python
# step 1: get the data
df_iceland = df_can.loc['Iceland', years]
df_iceland.head()
```




    1980    17
    1981    33
    1982    10
    1983     9
    1984    13
    Name: Iceland, dtype: object




```python
# step 2: plot data
df_iceland.plot(kind='bar', figsize=(10, 6))

plt.xlabel('Year') # add to x-label to the plot
plt.ylabel('Number of immigrants') # add y-label to the plot
plt.title('Icelandic immigrants to Canada from 1980 to 2013') # add title to the plot

plt.show()
```


![png](output_82_0.png)


The bar plot above shows the total number of immigrants broken down by each year. We can clearly see the impact of the financial crisis; the number of immigrants to Canada started increasing rapidly after 2008.

Let's annotate this on the plot using the `annotate` method of the **scripting layer** or the **pyplot interface**. We will pass in the following parameters:

*   `s`: str, the text of annotation.
*   `xy`: Tuple specifying the (x,y) point to annotate (in this case, end point of arrow).
*   `xytext`: Tuple specifying the (x,y) point to place the text (in this case, start point of arrow).
*   `xycoords`: The coordinate system that xy is given in - 'data' uses the coordinate system of the object being annotated (default).
*   `arrowprops`: Takes a dictionary of properties to draw the arrow:
    *   `arrowstyle`: Specifies the arrow style, `'->'` is standard arrow.
    *   `connectionstyle`: Specifies the connection type. `arc3` is a straight line.
    *   `color`: Specifies color of arrow.
    *   `lw`: Specifies the line width.

I encourage you to read the Matplotlib documentation for more details on annotations:
<http://matplotlib.orsg/api/pyplot_api.html#matplotlib.pyplot.annotate>.



```python
df_iceland.plot(kind='bar', figsize=(10, 6), rot=90)  # rotate the xticks(labelled points on x-axis) by 90 degrees

plt.xlabel('Year')
plt.ylabel('Number of Immigrants')
plt.title('Icelandic Immigrants to Canada from 1980 to 2013')

# Annotate arrow
plt.annotate('',  # s: str. Will leave it blank for no text
             xy=(32, 70),  # place head of the arrow at point (year 2012 , pop 70)
             xytext=(28, 20),  # place base of the arrow at point (year 2008 , pop 20)
             xycoords='data',  # will use the coordinate system of the object being annotated
             arrowprops=dict(arrowstyle='->', connectionstyle='arc3', color='blue', lw=2)
             )

plt.show()
```


![png](output_84_0.png)


Let's also annotate a text to go over the arrow.  We will pass in the following additional parameters:

*   `rotation`: rotation angle of text in degrees (counter clockwise)
*   `va`: vertical alignment of text \[‘center’ | ‘top’ | ‘bottom’ | ‘baseline’]
*   `ha`: horizontal alignment of text \[‘center’ | ‘right’ | ‘left’]



```python
df_iceland.plot(kind='bar', figsize=(10, 6), rot=90)

plt.xlabel('Year')
plt.ylabel('Number of Immigrants')
plt.title('Icelandic Immigrants to Canada from 1980 to 2013')

# Annotate arrow
plt.annotate('',  # s: str. will leave it blank for no text
             xy=(32, 70),  # place head of the arrow at point (year 2012 , pop 70)
             xytext=(28, 20),  # place base of the arrow at point (year 2008 , pop 20)
             xycoords='data',  # will use the coordinate system of the object being annotated
             arrowprops=dict(arrowstyle='->', connectionstyle='arc3', color='blue', lw=2)
             )

# Annotate Text
plt.annotate('2008 - 2011 Financial Crisis',  # text to display
             xy=(28, 30),  # start the text at at point (year 2008 , pop 30)
             rotation=72.5,  # based on trial and error to match the arrow
             va='bottom',  # want the text to be vertically 'bottom' aligned
             ha='left',  # want the text to be horizontally 'left' algned.
             )

plt.show()
```


![png](output_86_0.png)


**Horizontal Bar Plot**

Sometimes it is more practical to represent the data horizontally, especially if you need more room for labelling the bars. In horizontal bar graphs, the y-axis is used for labelling, and the length of bars on the x-axis corresponds to the magnitude of the variable being measured. As you will see, there is more room on the y-axis to  label categorical variables.

**Question:** Using the scripting later and the `df_can` dataset, create a *horizontal* bar plot showing the *total* number of immigrants to Canada from the top 15 countries, for the period 1980 - 2013. Label each country with the total immigrant count.


Step 1: Get the data pertaining to the top 15 countries.



```python
# Data pertaining to the top 15 countries
df_bar = df_can['Total'].head(15)
df_bar

```




    Country
    India                                                   691904
    China                                                   659962
    United Kingdom of Great Britain and Northern Ireland    551500
    Philippines                                             511391
    Pakistan                                                241600
    United States of America                                241122
    Iran (Islamic Republic of)                              175923
    Sri Lanka                                               148358
    Republic of Korea                                       142581
    Poland                                                  139241
    Lebanon                                                 115359
    France                                                  109091
    Jamaica                                                 106431
    Viet Nam                                                 97146
    Romania                                                  93585
    Name: Total, dtype: int64



Step 2: Plot data:

1.  Use `kind='barh'` to generate a bar chart with horizontal bars.
2.  Make sure to choose a good size for the plot and to label your axes and to give the plot a title.
3.  Loop through the countries and annotate the immigrant population using the anotate function of the scripting interface.



```python
### horizontal bar plot
df_bar.plot(kind = 'barh', figsize = (12,12))

plt.title('Top 15 Countries contributing to the Immigration to Canada between 1980 - 2013')
plt.xlabel('Number of Immigrants')

#Annotate
for index, value in enumerate(df_bar):
    label = format(int(value), ',')

    plt.annotate(label, xy = (value - 50000,index - 0.10), color = 'white')

plt.show()


```


![png](output_91_0.png)


### Thank you for completing this lab!

## Author

<a href="https://www.linkedin.com/in/aklson/?utm_medium=Exinfluencer&utm_source=Exinfluencer&utm_content=000026UJ&utm_term=10006555&utm_id=NA-SkillsNetwork-Channel-SkillsNetworkCoursesIBMDeveloperSkillsNetworkDV0101ENSkillsNetwork20297740-2021-01-01" target="_blank">Alex Aklson</a>

### Other Contributors

[Jay Rajasekharan](https://www.linkedin.com/in/jayrajasekharan?utm_medium=Exinfluencer&utm_source=Exinfluencer&utm_content=000026UJ&utm_term=10006555&utm_id=NA-SkillsNetwork-Channel-SkillsNetworkCoursesIBMDeveloperSkillsNetworkDV0101ENSkillsNetwork20297740-2021-01-01),
[Ehsan M. Kermani](https://www.linkedin.com/in/ehsanmkermani?utm_medium=Exinfluencer&utm_source=Exinfluencer&utm_content=000026UJ&utm_term=10006555&utm_id=NA-SkillsNetwork-Channel-SkillsNetworkCoursesIBMDeveloperSkillsNetworkDV0101ENSkillsNetwork20297740-2021-01-01),
[Slobodan Markovic](https://www.linkedin.com/in/slobodan-markovic?utm_medium=Exinfluencer&utm_source=Exinfluencer&utm_content=000026UJ&utm_term=10006555&utm_id=NA-SkillsNetwork-Channel-SkillsNetworkCoursesIBMDeveloperSkillsNetworkDV0101ENSkillsNetwork20297740-2021-01-01),
[Weiqing Wang](https://www.linkedin.com/in/weiqing-wang-641640133/?utm_medium=Exinfluencer&utm_source=Exinfluencer&utm_content=000026UJ&utm_term=10006555&utm_id=NA-SkillsNetwork-Channel-SkillsNetworkCoursesIBMDeveloperSkillsNetworkDV0101ENSkillsNetwork20297740-2021-01-01).

## Change Log

| Date (YYYY-MM-DD) | Version | Changed By    | Change Description                 |
| ----------------- | ------- | ------------- | ---------------------------------- |
| 2021-05-29        | 2.4     | Weiqing Wang  | Fixed typos and code smells.       |
| 2021-01-20        | 2.3     | Lakshmi Holla | Changed TOC cell markdown          |
| 2021-01-05        | 2.2     | Lakshmi Holla | Changed solution code for annotate |
| 2020-11-03        | 2.1     | Lakshmi Holla | Changed the URL of excel file      |
| 2020-08-27        | 2.0     | Lavanya       | Moved lab to course repo in GitLab |

## <h3 align="center"> © IBM Corporation 2020. All rights reserved. <h3/>

