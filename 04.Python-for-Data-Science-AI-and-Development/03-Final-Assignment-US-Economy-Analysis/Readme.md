<center>
    <img src="https://s3-api.us-geo.objectstorage.softlayer.net/cf-courses-data/CognitiveClass/Logos/organization_logo/organization_logo.png" width="300" alt="cognitiveclass.ai logo"  />
</center>


<h1>Analyzing US Economic Data and  Building a Dashboard  </h1>
<h2>Description</h2>


Extracting essential data from a dataset and displaying it is a necessary part of data science; therefore individuals can make correct decisions based on the data. In this assignment, you will extract some essential economic indicators from some data, you will then display these economic indicators in a Dashboard. You can then share the dashboard via an URL.

<p>
<a href="https://en.wikipedia.org/wiki/Gross_domestic_product?utm_medium=Exinfluencer&utm_source=Exinfluencer&utm_content=000026UJ&utm_term=10006555&utm_id=NA-SkillsNetwork-Channel-SkillsNetworkCoursesIBMDeveloperSkillsNetworkPY0101ENSkillsNetwork19487395-2021-01-01"> Gross domestic product (GDP)</a> is a measure of the market value of all the final goods and services produced in a period. GDP is an indicator of how well the economy is doing. A drop in GDP indicates the economy is producing less; similarly an increase in GDP suggests the economy is performing better. In this lab, you will examine how changes in GDP impact the unemployment rate. You will take screen shots of every step, you will share the notebook and the URL pointing to the dashboard.</p>


<h2>Table of Contents</h2>
<div class="alert alert-block alert-info" style="margin-top: 20px">
    <ul>
        <li><a href="https://#Section_1"> Define a Function that Makes a Dashboard </a></li>
    <li><a href="https://#Section_2">Question 1: Create a dataframe that contains the GDP data and display it</a> </li>
    <li><a href="https://#Section_3">Question 2: Create a dataframe that contains the unemployment data and display it</a></li>
    <li><a href="https://#Section_4">Question 3: Display a dataframe where unemployment was greater than 8.5%</a></li>
    <li><a href="https://#Section_5">Question 4: Use the function make_dashboard to make a dashboard</a></li>
        <li><a href="https://#Section_6"><b>(Optional not marked)</b> Save the dashboard on IBM cloud and display it</a></li>
    </ul>
<p>
    Estimated Time Needed: <strong>180 min</strong></p>
</div>

<hr>


<h2 id="Section_1"> Define Function that Makes a Dashboard  </h2>


We will import the following libraries.



```python
import pandas as pd
from bokeh.plotting import figure, output_file, show,output_notebook
output_notebook()
```



<div class="bk-root">
    <a href="https://bokeh.org" target="_blank" class="bk-logo bk-logo-small bk-logo-notebook"></a>
    <span id="1002">Loading BokehJS ...</span>
</div>




In this section, we define the function <code>make_dashboard</code>.
You don't have to know how the function works, you should only care about the inputs. The function will produce a dashboard as well as an html file. You can then use this html file to share your dashboard.



```python
def make_dashboard(x, gdp_change, unemployment, title, file_name):
    output_file(file_name)
    p = figure(title=title, x_axis_label='year', y_axis_label='%')
    p.line(x.squeeze(), gdp_change.squeeze(), color="firebrick", line_width=4, legend="% GDP change")
    p.line(x.squeeze(), unemployment.squeeze(), line_width=4, legend="% unemployed")
    show(p)
```

The dictionary  <code>links</code> contain the CSV files with all the data. The value for the key <code>GDP</code> is the file that contains the GDP data. The value for the key <code>unemployment</code> contains the unemployment data.



```python
links={'GDP':'https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-PY0101EN-SkillsNetwork/labs/FinalModule_Coursera/data/clean_gdp.csv',\
       'unemployment':'https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-PY0101EN-SkillsNetwork/labs/FinalModule_Coursera/data/clean_unemployment.csv'}
```

<h3 id="Section_2"> Question 1: Create a dataframe that contains the GDP data and display the first five rows of the dataframe.</h3>


Use the dictionary <code>links</code> and the function <code>pd.read_csv</code> to create a Pandas dataframes that contains the GDP data.


<b>Hint: <code>links\["GDP"]</code> contains the path or name of the file.</b>



```python
# Create a datframe called gdp_data

gdp_data = pd.read_csv(links["GDP"])

```

Use the method <code>head()</code> to display the first five rows of the GDP data, then take a screen-shot.



```python
#Display first 5 entries

gdp_data.head()
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
      <th>date</th>
      <th>level-current</th>
      <th>level-chained</th>
      <th>change-current</th>
      <th>change-chained</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1948</td>
      <td>274.8</td>
      <td>2020.0</td>
      <td>-0.7</td>
      <td>-0.6</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1949</td>
      <td>272.8</td>
      <td>2008.9</td>
      <td>10.0</td>
      <td>8.7</td>
    </tr>
    <tr>
      <th>2</th>
      <td>1950</td>
      <td>300.2</td>
      <td>2184.0</td>
      <td>15.7</td>
      <td>8.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>1951</td>
      <td>347.3</td>
      <td>2360.0</td>
      <td>5.9</td>
      <td>4.1</td>
    </tr>
    <tr>
      <th>4</th>
      <td>1952</td>
      <td>367.7</td>
      <td>2456.1</td>
      <td>6.0</td>
      <td>4.7</td>
    </tr>
  </tbody>
</table>
</div>



<h3 id="Section_2"> Question 2: Create a dataframe that contains the unemployment data. Display the first five rows of the dataframe. </h3>


Use the dictionary <code>links</code> and the function <code>pd.read_csv</code> to create a Pandas dataframes that contains the unemployment data.



```python
# Create a datframe called gdp_data

unemployment_data = pd.read_csv(links["unemployment"])
```

Use the method <code>head()</code> to display the first five rows of the unemployment data, then take a screen-shot.



```python
#Display first 5 entries

unemployment_data.head()
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
      <th>date</th>
      <th>unemployment</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1948</td>
      <td>3.750000</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1949</td>
      <td>6.050000</td>
    </tr>
    <tr>
      <th>2</th>
      <td>1950</td>
      <td>5.208333</td>
    </tr>
    <tr>
      <th>3</th>
      <td>1951</td>
      <td>3.283333</td>
    </tr>
    <tr>
      <th>4</th>
      <td>1952</td>
      <td>3.025000</td>
    </tr>
  </tbody>
</table>
</div>



<h3 id="Section_3">Question 3: Display a dataframe where unemployment was greater than 8.5%. Take a screen-shot.</h3>



```python
#Unemployment > 8.5%

unemployment_data[unemployment_data["unemployment"]>8.5]
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
      <th>date</th>
      <th>unemployment</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>34</th>
      <td>1982</td>
      <td>9.708333</td>
    </tr>
    <tr>
      <th>35</th>
      <td>1983</td>
      <td>9.600000</td>
    </tr>
    <tr>
      <th>61</th>
      <td>2009</td>
      <td>9.283333</td>
    </tr>
    <tr>
      <th>62</th>
      <td>2010</td>
      <td>9.608333</td>
    </tr>
    <tr>
      <th>63</th>
      <td>2011</td>
      <td>8.933333</td>
    </tr>
  </tbody>
</table>
</div>



<h3 id="Section_4">Question 4: Use the function make_dashboard to make a dashboard</h3>


In this section, you will call the function  <code>make_dashboard</code> , to produce a dashboard. We will use the convention of giving each variable the same name as the function parameter.


Create a new dataframe with the column <code>'date'</code> called <code>x</code> from the dataframe that contains the GDP data.



```python
x = gdp_data[["date"]]

x.head()
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
      <th>date</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1948</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1949</td>
    </tr>
    <tr>
      <th>2</th>
      <td>1950</td>
    </tr>
    <tr>
      <th>3</th>
      <td>1951</td>
    </tr>
    <tr>
      <th>4</th>
      <td>1952</td>
    </tr>
  </tbody>
</table>
</div>



Create a new dataframe with the column <code>'change-current' </code> called <code>gdp_change</code>  from the dataframe that contains the GDP data.



```python
gdp_change =gdp_data[["change-current"]]

gdp_change.head()
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
      <th>change-current</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>-0.7</td>
    </tr>
    <tr>
      <th>1</th>
      <td>10.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>15.7</td>
    </tr>
    <tr>
      <th>3</th>
      <td>5.9</td>
    </tr>
    <tr>
      <th>4</th>
      <td>6.0</td>
    </tr>
  </tbody>
</table>
</div>



Create a new dataframe with the column <code>'unemployment' </code> called <code>unemployment</code>  from the dataframe that contains the  unemployment data.



```python
unemployment = unemployment_data[["unemployment"]]

unemployment.head()
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
      <th>unemployment</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>3.750000</td>
    </tr>
    <tr>
      <th>1</th>
      <td>6.050000</td>
    </tr>
    <tr>
      <th>2</th>
      <td>5.208333</td>
    </tr>
    <tr>
      <th>3</th>
      <td>3.283333</td>
    </tr>
    <tr>
      <th>4</th>
      <td>3.025000</td>
    </tr>
  </tbody>
</table>
</div>



Give your dashboard a string title, and assign it to the variable <code>title</code>



```python
title = "US Economy Analysis"
```

Finally, the function <code>make_dashboard</code> will output an <code>.html</code> in your direictory, just like a <code>csv</code> file. The name of the file is <code>"index.html"</code> and it will be stored in the varable  <code>file_name</code>.



```python
file_name = "index.html"
```

Call the function <code>make_dashboard</code> , to produce a dashboard.  Assign the parameter values accordingly take a the <b>, take a screen shot of the dashboard and submit it</b>.



```python

# make_dashboard(x=, gdp_change=, unemployment=, title=, file_name=)
make_dashboard(x,gdp_change,unemployment,title,file_name)
```

    BokehDeprecationWarning: 'legend' keyword is deprecated, use explicit 'legend_label', 'legend_field', or 'legend_group' keywords instead
    BokehDeprecationWarning: 'legend' keyword is deprecated, use explicit 'legend_label', 'legend_field', or 'legend_group' keywords instead

<ing src="./Dashboard.jpg" />
![Dashboard](https://github.com/prathikshetty9b/IBM-Data-Science/blob/main/04.Python-for-Data-Science-AI-and-Development/03-Final-Assignment-US-Economy-Analysis/Dashboard.jpg)







<div class="bk-root" id="a23dd8c1-7842-4cb5-93f7-2a6d9f8fbb30" data-root-id="1003"></div>

<h2>About the Authors:</h2> 

<a href="https://www.linkedin.com/in/joseph-s-50398b136/?utm_medium=Exinfluencer&utm_source=Exinfluencer&utm_content=000026UJ&utm_term=10006555&utm_id=NA-SkillsNetwork-Channel-SkillsNetworkCoursesIBMDeveloperSkillsNetworkPY0101ENSkillsNetwork19487395-2021-01-01">Joseph Santarcangelo</a> has a PhD in Electrical Engineering, his research focused on using machine learning, signal processing, and computer vision to determine how videos impact human cognition. Joseph has been working for IBM since he completed his PhD.

<p>
Other contributors: <a href="https://www.linkedin.com/in/yi-leng-yao-84451275/?utm_medium=Exinfluencer&utm_source=Exinfluencer&utm_content=000026UJ&utm_term=10006555&utm_id=NA-SkillsNetwork-Channel-SkillsNetworkCoursesIBMDeveloperSkillsNetworkPY0101ENSkillsNetwork19487395-2021-01-01">Yi leng Yao</a>, <a href="https://www.linkedin.com/in/jiahui-mavis-zhou-a4537814a?utm_medium=Exinfluencer&utm_source=Exinfluencer&utm_content=000026UJ&utm_term=10006555&utm_id=NA-SkillsNetwork-Channel-SkillsNetworkCoursesIBMDeveloperSkillsNetworkPY0101ENSkillsNetwork19487395-2021-01-01">Mavis Zhou</a> 
</p>


<h2>References :</h2> 


<ul>
 <il>
     1) <a href="https://research.stlouisfed.org/?utm_medium=Exinfluencer&utm_source=Exinfluencer&utm_content=000026UJ&utm_term=10006555&utm_id=NA-SkillsNetwork-Channel-SkillsNetworkCoursesIBMDeveloperSkillsNetworkPY0101ENSkillsNetwork19487395-2021-01-01">Economic Research at the St. Louis Fed </a>:<a href="https://fred.stlouisfed.org/series/UNRATE/?utm_medium=Exinfluencer&utm_source=Exinfluencer&utm_content=000026UJ&utm_term=10006555&utm_id=NA-SkillsNetwork-Channel-SkillsNetworkCoursesIBMDeveloperSkillsNetworkPY0101ENSkillsNetwork19487395-2021-01-01"> Civilian Unemployment Rate</a>
   </il>   
    <p>
     <il>
    2) <a href="https://github.com/datasets?utm_medium=Exinfluencer&utm_source=Exinfluencer&utm_content=000026UJ&utm_term=10006555&utm_id=NA-SkillsNetwork-Channel-SkillsNetworkCoursesIBMDeveloperSkillsNetworkPY0101ENSkillsNetwork19487395-2021-01-01">Data Packaged Core Datasets
       </a>
   </il> 
    </p>

</ul>
</div>


## Change Log

| Date (YYYY-MM-DD) | Version | Changed By    | Change Description        |
| ----------------- | ------- | ------------- | ------------------------- |
| 2020-11-10        | 1.1     | Malika Singla | Deleted the Optional part |
| 2020-08-27        | 1.0     | Malika Singla | Added lab to GitLab       |

<hr>

## <h3 align="center"> © IBM Corporation 2020. All rights reserved. <h3/>

<p>

