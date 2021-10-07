<center>
    <img src="https://s3-api.us-geo.objectstorage.softlayer.net/cf-courses-data/CognitiveClass/Logos/organization_logo/organization_logo.png" width="300" alt="cognitiveclass.ai logo"  />
</center>

# Application Programming Interface

Estimated time needed: **15** minutes

## Objectives

After completing this lab you will be able to:

-   Create and Use APIs in Python


### Introduction

An API lets two pieces of software talk to each other. Just like a function,  you don’t have to know how the API works only its inputs and outputs.  An essential type of API is a REST API that allows you to access resources via the internet. In this lab, we will review the Pandas Library  in the context of an API, we will also review a basic REST API  


## Table of Contents

<div class="alert alert-block alert-info" style="margin-top: 20px">
<li><a href="#ref0">Pandas is an API</a></li>
<li><a href="#ref1">REST APIs Basics  </a></li>
<li><a href="#ref2">Quiz on Tuples</a></li>

</div>

<hr>



```python
!pip install nba_api
```

    Collecting nba_api
      Downloading nba_api-1.1.9-py3-none-any.whl (242 kB)
    [K     |████████████████████████████████| 242 kB 32.0 MB/s eta 0:00:01
    [?25hRequirement already satisfied: requests in /home/jupyterlab/conda/envs/python/lib/python3.7/site-packages (from nba_api) (2.26.0)
    Requirement already satisfied: certifi>=2017.4.17 in /home/jupyterlab/conda/envs/python/lib/python3.7/site-packages (from requests->nba_api) (2021.5.30)
    Requirement already satisfied: urllib3<1.27,>=1.21.1 in /home/jupyterlab/conda/envs/python/lib/python3.7/site-packages (from requests->nba_api) (1.26.7)
    Requirement already satisfied: idna<4,>=2.5 in /home/jupyterlab/conda/envs/python/lib/python3.7/site-packages (from requests->nba_api) (3.1)
    Requirement already satisfied: charset-normalizer~=2.0.0 in /home/jupyterlab/conda/envs/python/lib/python3.7/site-packages (from requests->nba_api) (2.0.0)
    Installing collected packages: nba-api
    Successfully installed nba-api-1.1.9


<h2 id="PandasAPI">Pandas is an API </h2>


You will use this function in the lab:



```python
def one_dict(list_dict):
    keys=list_dict[0].keys()
    out_dict={key:[] for key in keys}
    for dict_ in list_dict:
        for key, value in dict_.items():
            out_dict[key].append(value)
    return out_dict    
```

<h2 id="PandasAPI">Pandas is an API </h2>


Pandas is actually set of software components , much of  which is not even written in Python.



```python
import pandas as pd
import matplotlib.pyplot as plt
```

You create a dictionary, this is just data.



```python
dict_={'a':[11,21,31],'b':[12,22,32]}
```

When you create a Pandas object with the Dataframe constructor in API lingo, this is an "instance". The data in the dictionary is passed along to the pandas API. You then use the dataframe to communicate with the API.



```python
df=pd.DataFrame(dict_)
type(df)
```




    pandas.core.frame.DataFrame



<img src = "https://s3-api.us-geo.objectstorage.softlayer.net/cf-courses-data/CognitiveClass/PY0101EN/Chapter%206/images/pandas_api.png" width = 800, align = "center" alt="logistic regression block diagram" />


When you call the method head the dataframe communicates with the API displaying the first few rows of the dataframe.



```python
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
      <th>a</th>
      <th>b</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>11</td>
      <td>12</td>
    </tr>
    <tr>
      <th>1</th>
      <td>21</td>
      <td>22</td>
    </tr>
    <tr>
      <th>2</th>
      <td>31</td>
      <td>32</td>
    </tr>
  </tbody>
</table>
</div>



When you call the method mean,the API will calculate the mean and return the value.



```python
df.mean()
```




    a    21.0
    b    22.0
    dtype: float64



<h2 id="ref1">REST APIs</h2>


<p>Rest API’s function by sending a <b>request</b>,  the request is communicated via HTTP message. The HTTP message usually contains a JSON file. This contains instructions for what operation we would like the service or <b>resource</b> to perform. In a similar manner, API returns a <b>response</b>, via an HTTP message, this response is usually contained within a JSON.</p>
<p>In this lab, we will use the <a href=https://pypi.org/project/nba-api/>NBA API</a> to determine how well the Golden State Warriors performed against the Toronto Raptors. We will use the API do the determined number of points the Golden State Warriors won or lost by for each game. So if the value is three, the Golden State Warriors won by three points. Similarly it the  Golden State Warriors lost  by two points the result will be negative two. The API is relatively will handle a lot of the details such a Endpoints and Authentication </p>


In the nba api to make a request for a specific team, it's quite simple, we don't require a JSON all we require is an id. This information is stored locally in the API we import the module teams 



```python
from nba_api.stats.static import teams
import matplotlib.pyplot as plt
```


```python
#https://pypi.org/project/nba-api/
```

The method <code>get_teams()</code> returns a list of dictionaries  the dictionary key id has a unique identifier for each team as a value 



```python
nba_teams = teams.get_teams()
```

The dictionary key id has a unique identifier for each team as a value, let's look at the first three elements of the list:



```python
nba_teams[0:3]
```




    [{'id': 1610612737,
      'full_name': 'Atlanta Hawks',
      'abbreviation': 'ATL',
      'nickname': 'Hawks',
      'city': 'Atlanta',
      'state': 'Atlanta',
      'year_founded': 1949},
     {'id': 1610612738,
      'full_name': 'Boston Celtics',
      'abbreviation': 'BOS',
      'nickname': 'Celtics',
      'city': 'Boston',
      'state': 'Massachusetts',
      'year_founded': 1946},
     {'id': 1610612739,
      'full_name': 'Cleveland Cavaliers',
      'abbreviation': 'CLE',
      'nickname': 'Cavaliers',
      'city': 'Cleveland',
      'state': 'Ohio',
      'year_founded': 1970}]



To make things easier, we can convert the dictionary to a table. First, we use the function <code>one dict</code>, to create a dictionary. We use the common keys for each team as the keys,  the value is a list; each element of the list corresponds to the values for each team.
We then convert the dictionary to a dataframe, each row contains the information for a different team.



```python
dict_nba_team=one_dict(nba_teams)
df_teams=pd.DataFrame(dict_nba_team)
df_teams.head()
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
      <th>id</th>
      <th>full_name</th>
      <th>abbreviation</th>
      <th>nickname</th>
      <th>city</th>
      <th>state</th>
      <th>year_founded</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1610612737</td>
      <td>Atlanta Hawks</td>
      <td>ATL</td>
      <td>Hawks</td>
      <td>Atlanta</td>
      <td>Atlanta</td>
      <td>1949</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1610612738</td>
      <td>Boston Celtics</td>
      <td>BOS</td>
      <td>Celtics</td>
      <td>Boston</td>
      <td>Massachusetts</td>
      <td>1946</td>
    </tr>
    <tr>
      <th>2</th>
      <td>1610612739</td>
      <td>Cleveland Cavaliers</td>
      <td>CLE</td>
      <td>Cavaliers</td>
      <td>Cleveland</td>
      <td>Ohio</td>
      <td>1970</td>
    </tr>
    <tr>
      <th>3</th>
      <td>1610612740</td>
      <td>New Orleans Pelicans</td>
      <td>NOP</td>
      <td>Pelicans</td>
      <td>New Orleans</td>
      <td>Louisiana</td>
      <td>2002</td>
    </tr>
    <tr>
      <th>4</th>
      <td>1610612741</td>
      <td>Chicago Bulls</td>
      <td>CHI</td>
      <td>Bulls</td>
      <td>Chicago</td>
      <td>Illinois</td>
      <td>1966</td>
    </tr>
  </tbody>
</table>
</div>



Will use the team's nickname to find the unique id, we can see the row that contains the warriors by using the column nickname as follows:



```python
df_warriors=df_teams[df_teams['nickname']=='Warriors']
df_warriors
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
      <th>id</th>
      <th>full_name</th>
      <th>abbreviation</th>
      <th>nickname</th>
      <th>city</th>
      <th>state</th>
      <th>year_founded</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>7</th>
      <td>1610612744</td>
      <td>Golden State Warriors</td>
      <td>GSW</td>
      <td>Warriors</td>
      <td>Golden State</td>
      <td>California</td>
      <td>1946</td>
    </tr>
  </tbody>
</table>
</div>



we can use the following line of code to access the first column of the dataframe:



```python
id_warriors=df_warriors[['id']].values[0][0]
#we now have an integer that can be used   to request the Warriors information 
id_warriors
```




    1610612744



The function "League Game Finder " will make an API call, its in the module <code>stats.endpoints</code> 



```python
from nba_api.stats.endpoints import leaguegamefinder
```

The parameter <code>team_id_nullable</code> is the unique ID for the warriors. Under the hood, the NBA API is making a HTTP request.  
The information requested is provided and is transmitted via an HTTP response this is assigned to the object <code>gamefinder</code>.



```python
# Since https://stats.nba.com does not allow api calls from Cloud IPs and Skills Network Labs uses a Cloud IP.
# The following code is comment out, you can run it on jupyter labs on your own computer.
# gamefinder = leaguegamefinder.LeagueGameFinder(team_id_nullable=id_warriors)
```

we can see the json file by running the following line of code. 



```python
# Since https://stats.nba.com does not allow api calls from Cloud IPs and Skills Network Labs uses a Cloud IP.
#The following code is comment out, you can run it on jupyter labs on your own computer.
#gamefinder.get_json()
```


    ---------------------------------------------------------------------------

    NameError                                 Traceback (most recent call last)

    /tmp/ipykernel_65/3711185103.py in <module>
          1 # Since https://stats.nba.com does not allow api calls from Cloud IPs and Skills Network Labs uses a Cloud IP.
          2 #The following code is comment out, you can run it on jupyter labs on your own computer.
    ----> 3 gamefinder.get_json()
    

    NameError: name 'gamefinder' is not defined


The game finder object has a method <code>get_data_frames()</code>, that returns a dataframe.  If we view the dataframe, we can see it contains information about all the games the Warriors played.  The <code>PLUS_MINUS</code> column contains information on the score, if the value is negative the Warriors lost by that many points, if the value is positive, the warriors one by that amount of points. The column <code>MATCHUP </code>had the team the Warriors were playing, GSW stands for Golden State Warriors and TOR means Toronto Raptors; <code>vs</code> signifies it was a home game and the <code>@ </code>symbol means an away game.



```python
# Since https://stats.nba.com does not allow api calls from Cloud IPs and Skills Network Labs uses a Cloud IP.
# The following code is comment out, you can run it on jupyter labs on your own computer.
#games = gamefinder.get_data_frames()[0]
#games.head()
```

you can download the dataframe from the API call for Golden State and run the rest like a video.



```python
! wget https://s3-api.us-geo.objectstorage.softlayer.net/cf-courses-data/CognitiveClass/PY0101EN/Chapter%205/Labs/Golden_State.pkl
```

    --2021-10-07 13:39:38--  https://s3-api.us-geo.objectstorage.softlayer.net/cf-courses-data/CognitiveClass/PY0101EN/Chapter%205/Labs/Golden_State.pkl
    Resolving s3-api.us-geo.objectstorage.softlayer.net (s3-api.us-geo.objectstorage.softlayer.net)... 67.228.254.196
    Connecting to s3-api.us-geo.objectstorage.softlayer.net (s3-api.us-geo.objectstorage.softlayer.net)|67.228.254.196|:443... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 811065 (792K) [application/octet-stream]
    Saving to: ‘Golden_State.pkl.1’
    
    Golden_State.pkl.1  100%[===================>] 792.06K  --.-KB/s    in 0.02s   
    
    2021-10-07 13:39:38 (49.9 MB/s) - ‘Golden_State.pkl.1’ saved [811065/811065]
    



```python
file_name = "Golden_State.pkl"
games = pd.read_pickle(file_name)
games.head()
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
      <th>SEASON_ID</th>
      <th>TEAM_ID</th>
      <th>TEAM_ABBREVIATION</th>
      <th>TEAM_NAME</th>
      <th>GAME_ID</th>
      <th>GAME_DATE</th>
      <th>MATCHUP</th>
      <th>WL</th>
      <th>MIN</th>
      <th>PTS</th>
      <th>...</th>
      <th>FT_PCT</th>
      <th>OREB</th>
      <th>DREB</th>
      <th>REB</th>
      <th>AST</th>
      <th>STL</th>
      <th>BLK</th>
      <th>TOV</th>
      <th>PF</th>
      <th>PLUS_MINUS</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>22019</td>
      <td>1610612744</td>
      <td>GSW</td>
      <td>Golden State Warriors</td>
      <td>1521900066</td>
      <td>2019-07-12</td>
      <td>GSW vs. LAL</td>
      <td>L</td>
      <td>200</td>
      <td>87</td>
      <td>...</td>
      <td>0.800</td>
      <td>13.0</td>
      <td>29.0</td>
      <td>42.0</td>
      <td>13</td>
      <td>10.0</td>
      <td>3</td>
      <td>11.0</td>
      <td>21</td>
      <td>3.2</td>
    </tr>
    <tr>
      <th>1</th>
      <td>22019</td>
      <td>1610612744</td>
      <td>GSW</td>
      <td>Golden State Warriors</td>
      <td>1521900058</td>
      <td>2019-07-10</td>
      <td>GSW @ DEN</td>
      <td>W</td>
      <td>201</td>
      <td>73</td>
      <td>...</td>
      <td>0.867</td>
      <td>7.0</td>
      <td>27.0</td>
      <td>34.0</td>
      <td>10</td>
      <td>11.0</td>
      <td>7</td>
      <td>20.0</td>
      <td>20</td>
      <td>-8.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>22019</td>
      <td>1610612744</td>
      <td>GSW</td>
      <td>Golden State Warriors</td>
      <td>1521900039</td>
      <td>2019-07-08</td>
      <td>GSW @ LAL</td>
      <td>W</td>
      <td>200</td>
      <td>88</td>
      <td>...</td>
      <td>0.621</td>
      <td>8.0</td>
      <td>29.0</td>
      <td>37.0</td>
      <td>21</td>
      <td>10.0</td>
      <td>4</td>
      <td>13.0</td>
      <td>22</td>
      <td>8.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>22019</td>
      <td>1610612744</td>
      <td>GSW</td>
      <td>Golden State Warriors</td>
      <td>1521900020</td>
      <td>2019-07-07</td>
      <td>GSW vs. TOR</td>
      <td>W</td>
      <td>201</td>
      <td>80</td>
      <td>...</td>
      <td>0.923</td>
      <td>6.0</td>
      <td>37.0</td>
      <td>43.0</td>
      <td>18</td>
      <td>8.0</td>
      <td>3</td>
      <td>20.0</td>
      <td>25</td>
      <td>10.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>22019</td>
      <td>1610612744</td>
      <td>GSW</td>
      <td>Golden State Warriors</td>
      <td>1521900007</td>
      <td>2019-07-05</td>
      <td>GSW vs. CHA</td>
      <td>L</td>
      <td>200</td>
      <td>85</td>
      <td>...</td>
      <td>0.889</td>
      <td>8.0</td>
      <td>28.0</td>
      <td>36.0</td>
      <td>19</td>
      <td>9.0</td>
      <td>3</td>
      <td>13.0</td>
      <td>15</td>
      <td>-8.0</td>
    </tr>
  </tbody>
</table>
<p>5 rows × 28 columns</p>
</div>



We can create two dataframes, one  for the games that the Warriors faced the raptors at home and the second for away games.



```python
games_home=games [games ['MATCHUP']=='GSW vs. TOR']
games_away=games [games ['MATCHUP']=='GSW @ TOR']
```

We can calculate the mean for the column  <code>PLUS_MINUS</code> for the dataframes  <code>games_home</code> and <code> games_away</code>:



```python
games_home.mean()['PLUS_MINUS']
```

    /home/jupyterlab/conda/envs/python/lib/python3.7/site-packages/ipykernel_launcher.py:1: FutureWarning: Dropping of nuisance columns in DataFrame reductions (with 'numeric_only=None') is deprecated; in a future version this will raise TypeError.  Select only valid columns before calling the reduction.
      """Entry point for launching an IPython kernel.





    3.730769230769231




```python
games_away.mean()['PLUS_MINUS']
```

    /home/jupyterlab/conda/envs/python/lib/python3.7/site-packages/ipykernel_launcher.py:1: FutureWarning: Dropping of nuisance columns in DataFrame reductions (with 'numeric_only=None') is deprecated; in a future version this will raise TypeError.  Select only valid columns before calling the reduction.
      """Entry point for launching an IPython kernel.





    -0.6071428571428571



We can plot out the <code>PLUS MINUS</code> column for  for the dataframes  <code>games_home</code> and <code> games_away</code>.
We see the warriors played better at home.



```python
fig, ax = plt.subplots()

games_away.plot(x='GAME_DATE',y='PLUS_MINUS', ax=ax)
games_home.plot(x='GAME_DATE',y='PLUS_MINUS', ax=ax)
ax.legend(["away", "home"])
plt.show()
```


![png](output_51_0.png)


<h2>Quiz</h2>


Calculate the mean for the column  <code>PTS</code> for the dataframes  <code>games_home</code> and <code> games_away</code>:



```python
# Write your code below and press Shift+Enter to execute
print(games_home.mean()['PTS'])
print(games_away.mean()['PTS']
```


      File "/tmp/ipykernel_65/3590682432.py", line 3
        print(games_away.mean()['PTS']
                                      ^
    SyntaxError: unexpected EOF while parsing



<details><summary>Click here for the solution</summary>

```python
games_home.mean()['PTS']

games_away.mean()['PTS']

```

</details>


 <a href="https://cloud.ibm.com/catalog/services/watson-studio"><img src = "https://ibm.box.com/shared/static/irypdxea2q4th88zu1o1tsd06dya10go.png" width = 750, align = "center"></a>


## Authors:

 [Joseph Santarcangelo](https://www.linkedin.com/in/joseph-s-50398b136?cm_mmc=Email_Newsletter-_-Developer_Ed%2BTech-_-WW_WW-_-SkillsNetwork-Courses-IBMDeveloperSkillsNetwork-PY0101EN-SkillsNetwork-19487395&cm_mmca1=000026UJ&cm_mmca2=10006555&cm_mmca3=M12345678&cvosrc=email.Newsletter.M12345678&cvo_campaign=000026UJ&cm_mmc=Email_Newsletter-_-Developer_Ed%2BTech-_-WW_WW-_-SkillsNetwork-Courses-IBMDeveloperSkillsNetwork-PY0101EN-SkillsNetwork-19487395&cm_mmca1=000026UJ&cm_mmca2=10006555&cm_mmca3=M12345678&cvosrc=email.Newsletter.M12345678&cvo_campaign=000026UJ) 

Joseph Santarcangelo has a PhD in Electrical Engineering, his research focused on using machine learning, signal processing, and computer vision to determine how videos impact human cognition. Joseph has been working for IBM since he completed his PhD.

## Change Log

| Date (YYYY-MM-DD) | Version | Changed By    | Change Description                 |
| ----------------- | ------- | ------------- | ---------------------------------- |
| 2020-09-09        | 2.1     | Malika Singla | Spell Check                        |
| 2020-08-26        | 2.0     | Lavanya       | Moved lab to course repo in GitLab |
|                   |         |               |                                    |
|                   |         |               |                                    |

<hr/>

## <h3 align="center"> © IBM Corporation 2020. All rights reserved. <h3/>

