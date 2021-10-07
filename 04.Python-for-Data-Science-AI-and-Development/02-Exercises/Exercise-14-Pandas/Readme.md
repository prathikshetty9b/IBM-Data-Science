<center>
    <img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-PY0101EN-SkillsNetwork/IDSNlogo.png" width="300" alt="cognitiveclass.ai logo"  />
</center>

# Introduction to Pandas in Python

Estimated time needed: **15** minutes

## Objectives

After completing this lab you will be able to:

*   Use Pandas to access and view data


<h2>Table of Contents</h2>
<div class="alert alert-block alert-info" style="margin-top: 20px">
    <ul>
        <li><a href="https://https://data/?utm_medium=Exinfluencer&utm_source=Exinfluencer&utm_content=000026UJ&utm_term=10006555&utm_id=NA-SkillsNetwork-Channel-SkillsNetworkCoursesIBMDeveloperSkillsNetworkPY0101ENSkillsNetwork19487395-2021-01-01set/?utm_medium=Exinfluencer&utm_source=Exinfluencer&utm_content=000026UJ&utm_term=10006555&utm_id=NA-SkillsNetwork-Channel-SkillsNetworkCoursesIBMDeveloperSkillsNetworkPY0101ENSkillsNetwork19487395-2021-01-01">About the Dataset</a></li>
        <li><a href="https://pandas/?utm_medium=Exinfluencer&utm_source=Exinfluencer&utm_content=000026UJ&utm_term=10006555&utm_id=NA-SkillsNetwork-Channel-SkillsNetworkCoursesIBMDeveloperSkillsNetworkPY0101ENSkillsNetwork19487395-2021-01-01">Introduction of <code>Pandas</code></a></li>
        <li><a href="data">Viewing Data and Accessing Data</a></li>
        <li><a href="https://quiz/?utm_medium=Exinfluencer&utm_source=Exinfluencer&utm_content=000026UJ&utm_term=10006555&utm_id=NA-SkillsNetwork-Channel-SkillsNetworkCoursesIBMDeveloperSkillsNetworkPY0101ENSkillsNetwork19487395-2021-01-01">Quiz on DataFrame</a></li>
    </ul>

</div>

<hr>


<h2 id="dataset">About the Dataset</h2>


The table has one row for each album and several columns.

<ul>
    <li><b>artist</b>: Name of the artist</li>
    <li><b>album</b>: Name of the album</li>
    <li><b>released_year</b>: Year the album was released</li>
    <li><b>length_min_sec</b>: Length of the album (hours,minutes,seconds)</li>
    <li><b>genre</b>: Genre of the album</li>
    <li><b>music_recording_sales_millions</b>: Music recording sales (millions in USD) on <a href="http://www.song-database.com/?utm_medium=Exinfluencer&utm_source=Exinfluencer&utm_content=000026UJ&utm_term=10006555&utm_id=NA-SkillsNetwork-Channel-SkillsNetworkCoursesIBMDeveloperSkillsNetworkPY0101ENSkillsNetwork19487395-2021-01-01?utm_medium=Exinfluencer&utm_source=Exinfluencer&utm_content=000026UJ&utm_term=10006555&utm_id=NA-SkillsNetwork-Channel-SkillsNetworkCoursesIBMDeveloperSkillsNetworkPY0101ENSkillsNetwork19487395-2021-01-01">[SONG://DATABASE]</a></li>
    <li><b>claimed_sales_millions</b>: Album's claimed sales (millions in USD) on <a href="http://www.song-database.com/">[SONG://DATABASE]</a></li>
    <li><b>date_released</b>: Date on which the album was released</li>
    <li><b>soundtrack</b>: Indicates if the album is the movie soundtrack (Y) or (N)</li>
    <li><b>rating_of_friends</b>: Indicates the rating from your friends from 1 to 10</li>
</ul>

You can see the dataset here:

<font size="1">
<table font-size:xx-small>
  <tr>
    <th>Artist</th>
    <th>Album</th> 
    <th>Released</th>
    <th>Length</th>
    <th>Genre</th> 
    <th>Music recording sales (millions)</th>
    <th>Claimed sales (millions)</th>
    <th>Released</th>
    <th>Soundtrack</th>
    <th>Rating (friends)</th>
  </tr>
  <tr>
    <td>Michael Jackson</td>
    <td>Thriller</td> 
    <td>1982</td>
    <td>00:42:19</td>
    <td>Pop, rock, R&B</td>
    <td>46</td>
    <td>65</td>
    <td>30-Nov-82</td>
    <td></td>
    <td>10.0</td>
  </tr>
  <tr>
    <td>AC/DC</td>
    <td>Back in Black</td> 
    <td>1980</td>
    <td>00:42:11</td>
    <td>Hard rock</td>
    <td>26.1</td>
    <td>50</td>
    <td>25-Jul-80</td>
    <td></td>
    <td>8.5</td>
  </tr>
    <tr>
    <td>Pink Floyd</td>
    <td>The Dark Side of the Moon</td> 
    <td>1973</td>
    <td>00:42:49</td>
    <td>Progressive rock</td>
    <td>24.2</td>
    <td>45</td>
    <td>01-Mar-73</td>
    <td></td>
    <td>9.5</td>
  </tr>
    <tr>
    <td>Whitney Houston</td>
    <td>The Bodyguard</td> 
    <td>1992</td>
    <td>00:57:44</td>
    <td>Soundtrack/R&B, soul, pop</td>
    <td>26.1</td>
    <td>50</td>
    <td>25-Jul-80</td>
    <td>Y</td>
    <td>7.0</td>
  </tr>
    <tr>
    <td>Meat Loaf</td>
    <td>Bat Out of Hell</td> 
    <td>1977</td>
    <td>00:46:33</td>
    <td>Hard rock, progressive rock</td>
    <td>20.6</td>
    <td>43</td>
    <td>21-Oct-77</td>
    <td></td>
    <td>7.0</td>
  </tr>
    <tr>
    <td>Eagles</td>
    <td>Their Greatest Hits (1971-1975)</td> 
    <td>1976</td>
    <td>00:43:08</td>
    <td>Rock, soft rock, folk rock</td>
    <td>32.2</td>
    <td>42</td>
    <td>17-Feb-76</td>
    <td></td>
    <td>9.5</td>
  </tr>
    <tr>
    <td>Bee Gees</td>
    <td>Saturday Night Fever</td> 
    <td>1977</td>
    <td>1:15:54</td>
    <td>Disco</td>
    <td>20.6</td>
    <td>40</td>
    <td>15-Nov-77</td>
    <td>Y</td>
    <td>9.0</td>
  </tr>
    <tr>
    <td>Fleetwood Mac</td>
    <td>Rumours</td> 
    <td>1977</td>
    <td>00:40:01</td>
    <td>Soft rock</td>
    <td>27.9</td>
    <td>40</td>
    <td>04-Feb-77</td>
    <td></td>
    <td>9.5</td>
  </tr>
</table></font>


<hr>


<h2 id="pandas">Introduction of <code>Pandas</code></h2>



```python
# Dependency needed to install file 

!pip install xlrd
```

    Requirement already satisfied: xlrd in /opt/conda/envs/Python-3.8-main/lib/python3.8/site-packages (2.0.1)



```python
# Import required library

import pandas as pd
```

After the import command, we now have access to a large number of pre-built classes and functions. This assumes the library is installed; in our lab environment all the necessary libraries are installed. One way pandas allows you to work with data is a dataframe. Let's go through the process to go from a comma separated values (<b>.csv</b>) file to a dataframe. This variable <code>csv_path</code> stores the path of the <b>.csv</b>, that is  used as an argument to the <code>read_csv</code> function. The result is stored in the object <code>df</code>, this is a common short form used for a variable referring to a Pandas dataframe.



```python
# Read data from CSV file

csv_path = 'https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-PY0101EN-SkillsNetwork/labs/Module%204/data/TopSellingAlbums.csv'
df = pd.read_csv(csv_path)
```

We can use the method <code>head()</code> to examine the first five rows of a dataframe:



```python
# Print first five rows of the dataframe

df.head()
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
      <th>Artist</th>
      <th>Album</th>
      <th>Released</th>
      <th>Length</th>
      <th>Genre</th>
      <th>Music Recording Sales (millions)</th>
      <th>Claimed Sales (millions)</th>
      <th>Released.1</th>
      <th>Soundtrack</th>
      <th>Rating</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Michael Jackson</td>
      <td>Thriller</td>
      <td>1982</td>
      <td>0:42:19</td>
      <td>pop, rock, R&amp;B</td>
      <td>46.0</td>
      <td>65</td>
      <td>30-Nov-82</td>
      <td>NaN</td>
      <td>10.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>AC/DC</td>
      <td>Back in Black</td>
      <td>1980</td>
      <td>0:42:11</td>
      <td>hard rock</td>
      <td>26.1</td>
      <td>50</td>
      <td>25-Jul-80</td>
      <td>NaN</td>
      <td>9.5</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Pink Floyd</td>
      <td>The Dark Side of the Moon</td>
      <td>1973</td>
      <td>0:42:49</td>
      <td>progressive rock</td>
      <td>24.2</td>
      <td>45</td>
      <td>01-Mar-73</td>
      <td>NaN</td>
      <td>9.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Whitney Houston</td>
      <td>The Bodyguard</td>
      <td>1992</td>
      <td>0:57:44</td>
      <td>R&amp;B, soul, pop</td>
      <td>27.4</td>
      <td>44</td>
      <td>17-Nov-92</td>
      <td>Y</td>
      <td>8.5</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Meat Loaf</td>
      <td>Bat Out of Hell</td>
      <td>1977</td>
      <td>0:46:33</td>
      <td>hard rock, progressive rock</td>
      <td>20.6</td>
      <td>43</td>
      <td>21-Oct-77</td>
      <td>NaN</td>
      <td>8.0</td>
    </tr>
  </tbody>
</table>
</div>



We use the path of the excel file and the function <code>read_excel</code>. The result is a data frame as before:



```python
# Read data from Excel File and print the first five rows

xlsx_path = 'https://s3-api.us-geo.objectstorage.softlayer.net/cf-courses-data/CognitiveClass/PY0101EN/Chapter%204/Datasets/TopSellingAlbums.xlsx'

df = pd.read_excel(xlsx_path)
df.head()
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
      <th>Artist</th>
      <th>Album</th>
      <th>Released</th>
      <th>Length</th>
      <th>Genre</th>
      <th>Music Recording Sales (millions)</th>
      <th>Claimed Sales (millions)</th>
      <th>Released.1</th>
      <th>Soundtrack</th>
      <th>Rating</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Michael Jackson</td>
      <td>Thriller</td>
      <td>1982</td>
      <td>00:42:19</td>
      <td>pop, rock, R&amp;B</td>
      <td>46.0</td>
      <td>65</td>
      <td>1982-11-30</td>
      <td>NaN</td>
      <td>10.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>AC/DC</td>
      <td>Back in Black</td>
      <td>1980</td>
      <td>00:42:11</td>
      <td>hard rock</td>
      <td>26.1</td>
      <td>50</td>
      <td>1980-07-25</td>
      <td>NaN</td>
      <td>9.5</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Pink Floyd</td>
      <td>The Dark Side of the Moon</td>
      <td>1973</td>
      <td>00:42:49</td>
      <td>progressive rock</td>
      <td>24.2</td>
      <td>45</td>
      <td>1973-03-01</td>
      <td>NaN</td>
      <td>9.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Whitney Houston</td>
      <td>The Bodyguard</td>
      <td>1992</td>
      <td>00:57:44</td>
      <td>R&amp;B, soul, pop</td>
      <td>27.4</td>
      <td>44</td>
      <td>1992-11-17</td>
      <td>Y</td>
      <td>8.5</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Meat Loaf</td>
      <td>Bat Out of Hell</td>
      <td>1977</td>
      <td>00:46:33</td>
      <td>hard rock, progressive rock</td>
      <td>20.6</td>
      <td>43</td>
      <td>1977-10-21</td>
      <td>NaN</td>
      <td>8.0</td>
    </tr>
  </tbody>
</table>
</div>



We can access the column <b>Length</b> and assign it a new dataframe <b>x</b>:



```python
# Access to the column Length

x = df[['Length']]
x
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
      <th>Length</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>00:42:19</td>
    </tr>
    <tr>
      <th>1</th>
      <td>00:42:11</td>
    </tr>
    <tr>
      <th>2</th>
      <td>00:42:49</td>
    </tr>
    <tr>
      <th>3</th>
      <td>00:57:44</td>
    </tr>
    <tr>
      <th>4</th>
      <td>00:46:33</td>
    </tr>
    <tr>
      <th>5</th>
      <td>00:43:08</td>
    </tr>
    <tr>
      <th>6</th>
      <td>01:15:54</td>
    </tr>
    <tr>
      <th>7</th>
      <td>00:40:01</td>
    </tr>
  </tbody>
</table>
</div>



The process is shown in the figure:


<img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-PY0101EN-SkillsNetwork/labs/Module%204/images/DataEgOne.png" width="750" />


<hr>


<h2 id="data">Viewing Data and Accessing Data</h2>


You can also get a column as a series. You can think of a Pandas series as a 1-D dataframe. Just use one bracket:



```python
# Get the column as a series

x = df['Length']
x
```




    0    00:42:19
    1    00:42:11
    2    00:42:49
    3    00:57:44
    4    00:46:33
    5    00:43:08
    6    01:15:54
    7    00:40:01
    Name: Length, dtype: object



You can also get a column as a dataframe. For example, we can assign the column <b>Artist</b>:



```python
# Get the column as a dataframe

x = df[['Artist']]
type(x)
```

You can do the same thing for multiple columns; we just put the dataframe name, in this case, <code>df</code>, and the name of the multiple column headers enclosed in double brackets. The result is a new dataframe comprised of the specified columns:



```python
# Access to multiple columns

y = df[['Artist','Length','Genre']]
y
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
      <th>Artist</th>
      <th>Length</th>
      <th>Genre</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Michael Jackson</td>
      <td>00:42:19</td>
      <td>pop, rock, R&amp;B</td>
    </tr>
    <tr>
      <th>1</th>
      <td>AC/DC</td>
      <td>00:42:11</td>
      <td>hard rock</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Pink Floyd</td>
      <td>00:42:49</td>
      <td>progressive rock</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Whitney Houston</td>
      <td>00:57:44</td>
      <td>R&amp;B, soul, pop</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Meat Loaf</td>
      <td>00:46:33</td>
      <td>hard rock, progressive rock</td>
    </tr>
    <tr>
      <th>5</th>
      <td>Eagles</td>
      <td>00:43:08</td>
      <td>rock, soft rock, folk rock</td>
    </tr>
    <tr>
      <th>6</th>
      <td>Bee Gees</td>
      <td>01:15:54</td>
      <td>disco</td>
    </tr>
    <tr>
      <th>7</th>
      <td>Fleetwood Mac</td>
      <td>00:40:01</td>
      <td>soft rock</td>
    </tr>
  </tbody>
</table>
</div>



The process is shown in the figure:


<img src = "https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-PY0101EN-SkillsNetwork/labs/Module%204/images/DataEgTwo.png" width="1100" />


One way to access unique elements is the <code>iloc</code> method, where you can access the 1st row and the 1st column as follows:



```python
# Access the value on the first row and the first column

df.iloc[0, 0]
```




    'Michael Jackson'



You can access the 2nd row and the 1st column as follows:



```python
# Access the value on the second row and the first column

df.iloc[1,0]
```




    'AC/DC'



You can access the 1st row and the 3rd column as follows:



```python
# Access the value on the first row and the third column

df.iloc[0,2]
```




    1982




```python
# Access the value on the second row and the third column
df.iloc[1,2]
```




    1980




```python

```

This is shown in the following image


<img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-PY0101EN-SkillsNetwork/labs/Module%204/images/2_loc.PNG" width="750" />


You can access the column using the name as well, the following are the same as above:



```python
# Access the column using the name

df.loc[1, 'Artist']
```




    'AC/DC'




```python
# Access the column using the name

df.loc[1, 'Genre']
```




    'hard rock'




```python
# Access the column using the name

df.loc[0, 'Released']
```




    1982




```python
# Access the column using the name

df.loc[1, 'Album']
```




    'Back in Black'



<img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-PY0101EN-SkillsNetwork/labs/Module%204/images/1_loc.png" width="750" />


You can perform slicing using both the index and the name of the column:



```python
# Slicing the dataframe

df.iloc[0:2, 0:3]
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
      <th>Artist</th>
      <th>Album</th>
      <th>Released</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Michael Jackson</td>
      <td>Thriller</td>
      <td>1982</td>
    </tr>
    <tr>
      <th>1</th>
      <td>AC/DC</td>
      <td>Back in Black</td>
      <td>1980</td>
    </tr>
  </tbody>
</table>
</div>



<img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-PY0101EN-SkillsNetwork/labs/Module%204/images/4_loc.png" width="750" />



```python
# Slicing the dataframe using name

df.loc[0:2, 'Artist':'Released']
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
      <th>Artist</th>
      <th>Album</th>
      <th>Released</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Michael Jackson</td>
      <td>Thriller</td>
      <td>1982</td>
    </tr>
    <tr>
      <th>1</th>
      <td>AC/DC</td>
      <td>Back in Black</td>
      <td>1980</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Pink Floyd</td>
      <td>The Dark Side of the Moon</td>
      <td>1973</td>
    </tr>
  </tbody>
</table>
</div>



<img src="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-PY0101EN-SkillsNetwork/labs/Module%204/images/3_loc.png" width="750" />


<hr>


<h2 id="quiz">Quiz on DataFrame</h2>


Use a variable <code>q</code> to store the column <b>Rating</b> as a dataframe



```python
# Write your code below and press Shift+Enter to execute
q = df[["Rating"]]
q
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
      <th>Rating</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>10.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>9.5</td>
    </tr>
    <tr>
      <th>2</th>
      <td>9.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>8.5</td>
    </tr>
    <tr>
      <th>4</th>
      <td>8.0</td>
    </tr>
    <tr>
      <th>5</th>
      <td>7.5</td>
    </tr>
    <tr>
      <th>6</th>
      <td>7.0</td>
    </tr>
    <tr>
      <th>7</th>
      <td>6.5</td>
    </tr>
  </tbody>
</table>
</div>



Assign the variable <code>q</code> to the dataframe that is made up of the column <b>Released</b> and <b>Artist</b>:



```python
# Write your code below and press Shift+Enter to execute
q = df[["Released", "Artist"]]
q
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
      <th>Released</th>
      <th>Artist</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1982</td>
      <td>Michael Jackson</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1980</td>
      <td>AC/DC</td>
    </tr>
    <tr>
      <th>2</th>
      <td>1973</td>
      <td>Pink Floyd</td>
    </tr>
    <tr>
      <th>3</th>
      <td>1992</td>
      <td>Whitney Houston</td>
    </tr>
    <tr>
      <th>4</th>
      <td>1977</td>
      <td>Meat Loaf</td>
    </tr>
    <tr>
      <th>5</th>
      <td>1976</td>
      <td>Eagles</td>
    </tr>
    <tr>
      <th>6</th>
      <td>1977</td>
      <td>Bee Gees</td>
    </tr>
    <tr>
      <th>7</th>
      <td>1977</td>
      <td>Fleetwood Mac</td>
    </tr>
  </tbody>
</table>
</div>



Access the 2nd row and the 3rd column of <code>df</code>:



```python
# Write your code below and press Shift+Enter to execute
df.iloc[1,2]

```




    1980



Use the following list to convert the dataframe index <code>df</code> to characters and assign it to <code>df_new</code>; find the element corresponding to the row index <code>a</code> and column  <code>'Artist'</code>. Then select the rows <code>a</code> through <code>d</code> for the column  <code>'Artist'</code>



```python
new_index=['a','b','c','d','e','f','g','h']

df_new = df
df_new.index = new_index
df_new.loc['a','Artist']


```




    'Michael Jackson'




```python
df_new.loc['a':'d','Artist']
```




    a    Michael Jackson
    b              AC/DC
    c         Pink Floyd
    d    Whitney Houston
    Name: Artist, dtype: object



<hr>
<h2>The last exercise!</h2>
<p>Congratulations, you have completed your first lesson and hands-on lab in Python. However, there is one more thing you need to do. The Data Science community encourages sharing work. The best way to share and showcase your work is to share it on GitHub. By sharing your notebook on GitHub you are not only building your reputation with fellow data scientists, but you can also show it off when applying for a job. Even though this was your first piece of work, it is never too early to start building good habits. So, please read and follow <a href="https://cognitiveclass.ai/blog/data-scientists-stand-out-by-sharing-your-notebooks/?utm_medium=Exinfluencer&utm_source=Exinfluencer&utm_content=000026UJ&utm_term=10006555&utm_id=NA-SkillsNetwork-Channel-SkillsNetworkCoursesIBMDeveloperSkillsNetworkPY0101ENSkillsNetwork19487395-2021-01-01" target="_blank">this article</a> to learn how to share your work.
<hr>


## Authors:

[Joseph Santarcangelo](https://www.linkedin.com/in/joseph-s-50398b136/?utm_medium=Exinfluencer&utm_source=Exinfluencer&utm_content=000026UJ&utm_term=10006555&utm_id=NA-SkillsNetwork-Channel-SkillsNetworkCoursesIBMDeveloperSkillsNetworkPY0101ENSkillsNetwork19487395-2021-01-01)

Joseph Santarcangelo has a PhD in Electrical Engineering, his research focused on using machine learning, signal processing, and computer vision to determine how videos impact human cognition. Joseph has been working for IBM since he completed his PhD.

## Change Log

| Date (YYYY-MM-DD) | Version | Changed By | Change Description                 |
| ----------------- | ------- | ---------- | ---------------------------------- |
| 2020-08-26        | 2.0     | Lavanya    | Moved lab to course repo in GitLab |
| 2020-11-24        | 3.0     | Nayef      | Added new images                   |
|                   |         |            |                                    |

<hr/>

## <h3 align="center"> © IBM Corporation 2020. All rights reserved. <h3/>

