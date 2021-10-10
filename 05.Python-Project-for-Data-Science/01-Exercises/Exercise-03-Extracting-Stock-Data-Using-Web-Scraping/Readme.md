<center>
    <img src="https://s3-api.us-geo.objectstorage.softlayer.net/cf-courses-data/CognitiveClass/Logos/organization_logo/organization_logo.png" width="300" alt="cognitiveclass.ai logo"  />
</center>


<h1>Extracting Stock Data Using a Web Scraping</h1>


Not all stock data is available via API in this assignment; you will use web-scraping to obtain financial data. You will be quizzed on your results.  
 Using beautiful soup we will extract historical share data from a web-page.


<h2>Table of Contents</h2>
<div class="alert alert-block alert-info" style="margin-top: 20px">
    <ul>
        <li>Downloading the Webpage Using Requests Library</li>
        <li>Parsing Webpage HTML Using BeautifulSoup</li>
        <li>Extracting Data and Building DataFrame</li>
    </ul>
<p>
    Estimated Time Needed: <strong>30 min</strong></p>
</div>

<hr>



```python
!pip install pandas
!pip install html5lib
!pip install requests
!pip install bs4
!pip install plotly
```

    Requirement already satisfied: pandas in /home/jupyterlab/conda/envs/python/lib/python3.7/site-packages (1.3.3)
    Requirement already satisfied: numpy>=1.17.3 in /home/jupyterlab/conda/envs/python/lib/python3.7/site-packages (from pandas) (1.21.2)
    Requirement already satisfied: python-dateutil>=2.7.3 in /home/jupyterlab/conda/envs/python/lib/python3.7/site-packages (from pandas) (2.8.2)
    Requirement already satisfied: pytz>=2017.3 in /home/jupyterlab/conda/envs/python/lib/python3.7/site-packages (from pandas) (2021.1)
    Requirement already satisfied: six>=1.5 in /home/jupyterlab/conda/envs/python/lib/python3.7/site-packages (from python-dateutil>=2.7.3->pandas) (1.16.0)
    Requirement already satisfied: html5lib in /home/jupyterlab/conda/envs/python/lib/python3.7/site-packages (1.1)
    Requirement already satisfied: webencodings in /home/jupyterlab/conda/envs/python/lib/python3.7/site-packages (from html5lib) (0.5.1)
    Requirement already satisfied: six>=1.9 in /home/jupyterlab/conda/envs/python/lib/python3.7/site-packages (from html5lib) (1.16.0)
    Requirement already satisfied: requests in /home/jupyterlab/conda/envs/python/lib/python3.7/site-packages (2.26.0)
    Requirement already satisfied: certifi>=2017.4.17 in /home/jupyterlab/conda/envs/python/lib/python3.7/site-packages (from requests) (2021.5.30)
    Requirement already satisfied: urllib3<1.27,>=1.21.1 in /home/jupyterlab/conda/envs/python/lib/python3.7/site-packages (from requests) (1.26.7)
    Requirement already satisfied: idna<4,>=2.5 in /home/jupyterlab/conda/envs/python/lib/python3.7/site-packages (from requests) (3.1)
    Requirement already satisfied: charset-normalizer~=2.0.0 in /home/jupyterlab/conda/envs/python/lib/python3.7/site-packages (from requests) (2.0.0)
    Requirement already satisfied: bs4 in /home/jupyterlab/conda/envs/python/lib/python3.7/site-packages (0.0.1)
    Requirement already satisfied: beautifulsoup4 in /home/jupyterlab/conda/envs/python/lib/python3.7/site-packages (from bs4) (4.10.0)
    Requirement already satisfied: soupsieve>1.2 in /home/jupyterlab/conda/envs/python/lib/python3.7/site-packages (from beautifulsoup4->bs4) (2.2.1)
    Requirement already satisfied: plotly in /home/jupyterlab/conda/envs/python/lib/python3.7/site-packages (5.3.1)
    Requirement already satisfied: six in /home/jupyterlab/conda/envs/python/lib/python3.7/site-packages (from plotly) (1.16.0)
    Requirement already satisfied: tenacity>=6.2.0 in /home/jupyterlab/conda/envs/python/lib/python3.7/site-packages (from plotly) (8.0.1)



```python
import pandas as pd
import requests
from bs4 import BeautifulSoup
```

## Using Webscraping to Extract Stock Data


Use the `requests` library to download the webpage [https://finance.yahoo.com/quote/AMZN/history?period1=1451606400&period2=1612137600&interval=1mo&filter=history&frequency=1mo&includeAdjustedClose=true](https://finance.yahoo.com/quote/AMZN/history?period1=1451606400&period2=1612137600&interval=1mo&filter=history&frequency=1mo&includeAdjustedClose=true&cm_mmc=Email_Newsletter-_-Developer_Ed%2BTech-_-WW_WW-_-SkillsNetwork-Courses-IBMDeveloperSkillsNetwork-PY0220EN-SkillsNetwork-23455606&cm_mmca1=000026UJ&cm_mmca2=10006555&cm_mmca3=M12345678&cvosrc=email.Newsletter.M12345678&cvo_campaign=000026UJ&cm_mmc=Email_Newsletter-_-Developer_Ed%2BTech-_-WW_WW-_-SkillsNetwork-Courses-IBMDeveloperSkillsNetwork-PY0220EN-SkillsNetwork-23455606&cm_mmca1=000026UJ&cm_mmca2=10006555&cm_mmca3=M12345678&cvosrc=email.Newsletter.M12345678&cvo_campaign=000026UJ&cm_mmc=Email_Newsletter-_-Developer_Ed%2BTech-_-WW_WW-_-SkillsNetwork-Courses-IBMDeveloperSkillsNetwork-PY0220EN-SkillsNetwork-23455606&cm_mmca1=000026UJ&cm_mmca2=10006555&cm_mmca3=M12345678&cvosrc=email.Newsletter.M12345678&cvo_campaign=000026UJ&cm_mmc=Email_Newsletter-_-Developer_Ed%2BTech-_-WW_WW-_-SkillsNetwork-Courses-IBMDeveloperSkillsNetwork-PY0220EN-SkillsNetwork-23455606&cm_mmca1=000026UJ&cm_mmca2=10006555&cm_mmca3=M12345678&cvosrc=email.Newsletter.M12345678&cvo_campaign=000026UJ). Save the text of the response as a variable named `html_data`.



```python
#url='https://finance.yahoo.com/quote/AMZN/history?period1=1451606400&period2=1612137600&interval=1mo&filter=history&frequency=1mo&includeAdjustedClose=true&cm_mmc=Email_Newsletter-_-Developer_Ed%2BTech-_-WW_WW-_-SkillsNetwork-Courses-IBMDeveloperSkillsNetwork-PY0220EN-SkillsNetwork-23455606&cm_mmca1=000026UJ&cm_mmca2=10006555&cm_mmca3=M12345678&cvosrc=email.Newsletter.M12345678&cvo_campaign=000026UJ&cm_mmc=Email_Newsletter-_-Developer_Ed%2BTech-_-WW_WW-_-SkillsNetwork-Courses-IBMDeveloperSkillsNetwork-PY0220EN-SkillsNetwork-23455606&cm_mmca1=000026UJ&cm_mmca2=10006555&cm_mmca3=M12345678&cvosrc=email.Newsletter.M12345678&cvo_campaign=000026UJ&cm_mmc=Email_Newsletter-_-Developer_Ed%2BTech-_-WW_WW-_-SkillsNetwork-Courses-IBMDeveloperSkillsNetwork-PY0220EN-SkillsNetwork-23455606&cm_mmca1=000026UJ&cm_mmca2=10006555&cm_mmca3=M12345678&cvosrc=email.Newsletter.M12345678&cvo_campaign=000026UJ&cm_mmc=Email_Newsletter-_-Developer_Ed%2BTech-_-WW_WW-_-SkillsNetwork-Courses-IBMDeveloperSkillsNetwork-PY0220EN-SkillsNetwork-23455606&cm_mmca1=000026UJ&cm_mmca2=10006555&cm_mmca3=M12345678&cvosrc=email.Newsletter.M12345678&cvo_campaign=000026UJ'
url = "https://ycharts.com/companies/AMZN/price"
html_data=requests.get(url).text
```

Parse the html data using `beautiful_soup`.



```python
soup=BeautifulSoup(html_data,'html.parser')
```

<b>Question 1</b> what is the content of the title attribute:



```python
soup.title
```




    <title>
        Amazon.com Price | AMZN
    </title>




```python
#soup.find_all("table")[0]
table_row = soup.find("table").find_all("tr")

#Pop Headings
table_row.pop(0)
table_row
```




    [<tr>
     <td class="col1">Oct. 8, 2021</td>
     <td class="col2">3317.00</td>
     <td class="col3">3321.43</td>
     <td class="col4">3288.20</td>
     <td class="col5">3288.62</td>
     <td class="col6">1.960M</td>
     </tr>,
     <tr>
     <td class="col1">Oct. 7, 2021</td>
     <td class="col2">3291.54</td>
     <td class="col3">3325.75</td>
     <td class="col4">3283.06</td>
     <td class="col5">3302.43</td>
     <td class="col6">2.409M</td>
     </tr>,
     <tr>
     <td class="col1">Oct. 6, 2021</td>
     <td class="col2">3213.53</td>
     <td class="col3">3264.34</td>
     <td class="col4">3198.62</td>
     <td class="col5">3262.01</td>
     <td class="col6">2.533M</td>
     </tr>,
     <tr>
     <td class="col1">Oct. 5, 2021</td>
     <td class="col2">3204.50</td>
     <td class="col3">3260.73</td>
     <td class="col4">3202.46</td>
     <td class="col5">3221.00</td>
     <td class="col6">3.269M</td>
     </tr>,
     <tr>
     <td class="col1">Oct. 4, 2021</td>
     <td class="col2">3279.39</td>
     <td class="col3">3279.99</td>
     <td class="col4">3176.25</td>
     <td class="col5">3189.78</td>
     <td class="col6">4.523M</td>
     </tr>,
     <tr>
     <td class="col1">Oct. 1, 2021</td>
     <td class="col2">3289.01</td>
     <td class="col3">3309.17</td>
     <td class="col4">3255.94</td>
     <td class="col5">3283.26</td>
     <td class="col6">2.836M</td>
     </tr>,
     <tr>
     <td class="col1">Sept. 30, 2021</td>
     <td class="col2">3316.00</td>
     <td class="col3">3327.85</td>
     <td class="col4">3273.99</td>
     <td class="col5">3285.04</td>
     <td class="col6">2.847M</td>
     </tr>,
     <tr>
     <td class="col1">Sept. 29, 2021</td>
     <td class="col2">3322.11</td>
     <td class="col3">3351.30</td>
     <td class="col4">3297.87</td>
     <td class="col5">3301.12</td>
     <td class="col6">2.562M</td>
     </tr>,
     <tr>
     <td class="col1">Sept. 28, 2021</td>
     <td class="col2">3357.71</td>
     <td class="col3">3369.19</td>
     <td class="col4">3290.10</td>
     <td class="col5">3315.96</td>
     <td class="col6">4.431M</td>
     </tr>,
     <tr>
     <td class="col1">Sept. 27, 2021</td>
     <td class="col2">3371.50</td>
     <td class="col3">3415.57</td>
     <td class="col4">3339.61</td>
     <td class="col5">3405.80</td>
     <td class="col6">3.634M</td>
     </tr>,
     <tr>
     <td class="col1">Sept. 24, 2021</td>
     <td class="col2">3402.01</td>
     <td class="col3">3429.26</td>
     <td class="col4">3393.40</td>
     <td class="col5">3425.52</td>
     <td class="col6">2.116M</td>
     </tr>,
     <tr>
     <td class="col1">Sept. 23, 2021</td>
     <td class="col2">3380.05</td>
     <td class="col3">3428.96</td>
     <td class="col4">3380.05</td>
     <td class="col5">3416.00</td>
     <td class="col6">2.379M</td>
     </tr>,
     <tr>
     <td class="col1">Sept. 22, 2021</td>
     <td class="col2">3351.00</td>
     <td class="col3">3389.00</td>
     <td class="col4">3341.05</td>
     <td class="col5">3380.05</td>
     <td class="col6">2.411M</td>
     </tr>,
     <tr>
     <td class="col1">Sept. 21, 2021</td>
     <td class="col2">3375.00</td>
     <td class="col3">3379.70</td>
     <td class="col4">3332.39</td>
     <td class="col5">3343.63</td>
     <td class="col6">2.781M</td>
     </tr>,
     <tr>
     <td class="col1">Sept. 20, 2021</td>
     <td class="col2">3396.00</td>
     <td class="col3">3419.00</td>
     <td class="col4">3305.01</td>
     <td class="col5">3355.73</td>
     <td class="col6">4.669M</td>
     </tr>,
     <tr>
     <td class="col1">Sept. 17, 2021</td>
     <td class="col2">3488.41</td>
     <td class="col3">3497.41</td>
     <td class="col4">3452.13</td>
     <td class="col5">3462.52</td>
     <td class="col6">4.617M</td>
     </tr>,
     <tr>
     <td class="col1">Sept. 16, 2021</td>
     <td class="col2">3459.96</td>
     <td class="col3">3492.55</td>
     <td class="col4">3446.14</td>
     <td class="col5">3488.24</td>
     <td class="col6">2.584M</td>
     </tr>,
     <tr>
     <td class="col1">Sept. 15, 2021</td>
     <td class="col2">3442.52</td>
     <td class="col3">3485.42</td>
     <td class="col4">3402.01</td>
     <td class="col5">3475.79</td>
     <td class="col6">2.958M</td>
     </tr>,
     <tr>
     <td class="col1">Sept. 14, 2021</td>
     <td class="col2">3475.55</td>
     <td class="col3">3486.81</td>
     <td class="col4">3437.71</td>
     <td class="col5">3450.00</td>
     <td class="col6">1.937M</td>
     </tr>,
     <tr>
     <td class="col1">Sept. 13, 2021</td>
     <td class="col2">3482.80</td>
     <td class="col3">3497.96</td>
     <td class="col4">3438.00</td>
     <td class="col5">3457.17</td>
     <td class="col6">2.569M</td>
     </tr>,
     <tr>
     <td class="col1">Sept. 10, 2021</td>
     <td class="col2">3501.83</td>
     <td class="col3">3508.45</td>
     <td class="col4">3462.91</td>
     <td class="col5">3469.15</td>
     <td class="col6">2.397M</td>
     </tr>,
     <tr>
     <td class="col1">Sept. 9, 2021</td>
     <td class="col2">3526.02</td>
     <td class="col3">3549.99</td>
     <td class="col4">3480.37</td>
     <td class="col5">3484.16</td>
     <td class="col6">2.719M</td>
     </tr>,
     <tr>
     <td class="col1">Sept. 8, 2021</td>
     <td class="col2">3511.65</td>
     <td class="col3">3545.63</td>
     <td class="col4">3495.67</td>
     <td class="col5">3525.50</td>
     <td class="col6">3.053M</td>
     </tr>,
     <tr>
     <td class="col1">Sept. 7, 2021</td>
     <td class="col2">3478.00</td>
     <td class="col3">3528.09</td>
     <td class="col4">3476.94</td>
     <td class="col5">3509.29</td>
     <td class="col6">2.741M</td>
     </tr>,
     <tr class="last">
     <td class="col1">Sept. 3, 2021</td>
     <td class="col2">3452.00</td>
     <td class="col3">3482.67</td>
     <td class="col4">3436.44</td>
     <td class="col5">3478.05</td>
     <td class="col6">2.578M</td>
     </tr>]



Using beautiful soup extract the table with historical share prices and store it into a dataframe named `amazon_data`. The dataframe should have columns Date, Open, High, Low, Close, Adj Close, and Volume. Fill in each variable with the correct data from the list `col`. 

Hint: Print the `col` list to see what data to use



```python
amazon_data = pd.DataFrame(columns=["Date", "Open", "High", "Low", "Close", "Volume"])

for row in table_row:
    col = row.find_all("td")
    date =col[0].text
    Open =col[1].text
    high =col[2].text
    low =col[3].text
    close =col[4].text
    volume =col[5].text
    amazon_data = amazon_data.append({"Date":date, "Open":Open, "High":high, "Low":low, "Close":close, "Volume":volume}, ignore_index=True)
```

Print out the first five rows of the `amazon_data` dataframe you created.



```python
amazon_data.head(10)
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
      <th>Date</th>
      <th>Open</th>
      <th>High</th>
      <th>Low</th>
      <th>Close</th>
      <th>Volume</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Oct. 8, 2021</td>
      <td>3317.00</td>
      <td>3321.43</td>
      <td>3288.20</td>
      <td>3288.62</td>
      <td>1.960M</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Oct. 7, 2021</td>
      <td>3291.54</td>
      <td>3325.75</td>
      <td>3283.06</td>
      <td>3302.43</td>
      <td>2.409M</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Oct. 6, 2021</td>
      <td>3213.53</td>
      <td>3264.34</td>
      <td>3198.62</td>
      <td>3262.01</td>
      <td>2.533M</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Oct. 5, 2021</td>
      <td>3204.50</td>
      <td>3260.73</td>
      <td>3202.46</td>
      <td>3221.00</td>
      <td>3.269M</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Oct. 4, 2021</td>
      <td>3279.39</td>
      <td>3279.99</td>
      <td>3176.25</td>
      <td>3189.78</td>
      <td>4.523M</td>
    </tr>
    <tr>
      <th>5</th>
      <td>Oct. 1, 2021</td>
      <td>3289.01</td>
      <td>3309.17</td>
      <td>3255.94</td>
      <td>3283.26</td>
      <td>2.836M</td>
    </tr>
    <tr>
      <th>6</th>
      <td>Sept. 30, 2021</td>
      <td>3316.00</td>
      <td>3327.85</td>
      <td>3273.99</td>
      <td>3285.04</td>
      <td>2.847M</td>
    </tr>
    <tr>
      <th>7</th>
      <td>Sept. 29, 2021</td>
      <td>3322.11</td>
      <td>3351.30</td>
      <td>3297.87</td>
      <td>3301.12</td>
      <td>2.562M</td>
    </tr>
    <tr>
      <th>8</th>
      <td>Sept. 28, 2021</td>
      <td>3357.71</td>
      <td>3369.19</td>
      <td>3290.10</td>
      <td>3315.96</td>
      <td>4.431M</td>
    </tr>
    <tr>
      <th>9</th>
      <td>Sept. 27, 2021</td>
      <td>3371.50</td>
      <td>3415.57</td>
      <td>3339.61</td>
      <td>3405.80</td>
      <td>3.634M</td>
    </tr>
  </tbody>
</table>
</div>



<b>Question 2</b> What is the name of the columns of the dataframe 



```python
amazon_data.columns
```




    Index(['Date', 'Open', 'High', 'Low', 'Close', 'Volume'], dtype='object')



<b>Question 3</b> What is the `Open` of `Jun 30, 2019` of the dataframe?



```python
open_price=amazon_data[amazon_data['Date']=='Sept. 30, 2021']
open_price
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
      <th>Date</th>
      <th>Open</th>
      <th>High</th>
      <th>Low</th>
      <th>Close</th>
      <th>Volume</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>6</th>
      <td>Sept. 30, 2021</td>
      <td>3316.00</td>
      <td>3327.85</td>
      <td>3273.99</td>
      <td>3285.04</td>
      <td>2.847M</td>
    </tr>
  </tbody>
</table>
</div>



<h2>About the Authors:</h2> 

<a href="https://www.linkedin.com/in/joseph-s-50398b136/">Joseph Santarcangelo</a> has a PhD in Electrical Engineering, his research focused on using machine learning, signal processing, and computer vision to determine how videos impact human cognition. Joseph has been working for IBM since he completed his PhD.

Azim Hirjani


## Change Log

| Date (YYYY-MM-DD) | Version | Changed By    | Change Description        |
| ----------------- | ------- | ------------- | ------------------------- |
| 2020-11-10        | 1.1     | Malika Singla | Deleted the Optional part |
| 2020-08-27        | 1.0     | Malika Singla | Added lab to GitLab       |

<hr>

## <h3 align="center"> © IBM Corporation 2020. All rights reserved. <h3/>

<p>

