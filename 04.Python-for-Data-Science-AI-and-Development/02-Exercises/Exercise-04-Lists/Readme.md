<center>
    <img src="https://s3-api.us-geo.objectstorage.softlayer.net/cf-courses-data/CognitiveClass/Logos/organization_logo/organization_logo.png" width="300" alt="cognitiveclass.ai logo"  />
</center>

# Lists in Python

Estimated time needed: **15** minutes

## Objectives

After completing this lab you will be able to:

-   Perform list operations in Python, including indexing, list manipulation and copy/clone list.


<h2>Table of Contents</h2>
<div class="alert alert-block alert-info" style="margin-top: 20px">
    <ul>
        <li>
            <a href="#dataset">About the Dataset</a>
        </li>
        <li>
            <a href="#list">Lists</a>
            <ul>
                <li><a href="index">Indexing</a></li>
                <li><a href="content">List Content</a></li>
                <li><a href="op">List Operations</a></li>
                <li><a href="co">Copy and Clone List</a></li>
            </ul>
        </li>
        <li>
            <a href="#quiz">Quiz on Lists</a>
        </li>
    </ul>
   
</div>

<hr>


<h2 id="#dataset">About the Dataset</h2>


Imagine you received album recommendations from your friends and compiled all of the recommandations into a table, with specific information about each album.

The table has one row for each movie and several columns:

-   **artist** - Name of the artist
-   **album** - Name of the album
-   **released_year** - Year the album was released
-   **length_min_sec** - Length of the album (hours,minutes,seconds)
-   **genre** - Genre of the album
-   **music_recording_sales_millions** - Music recording sales (millions in USD) on [SONG://DATABASE](http://www.song-database.com?cm_mmc=Email_Newsletter-_-Developer_Ed%2BTech-_-WW_WW-_-SkillsNetwork-Courses-IBMDeveloperSkillsNetwork-PY0101EN-SkillsNetwork-19487395&cm_mmca1=000026UJ&cm_mmca2=10006555&cm_mmca3=M12345678&cvosrc=email.Newsletter.M12345678&cvo_campaign=000026UJ&cm_mmc=Email_Newsletter-_-Developer_Ed%2BTech-_-WW_WW-_-SkillsNetwork-Courses-IBMDeveloperSkillsNetwork-PY0101EN-SkillsNetwork-19487395&cm_mmca1=000026UJ&cm_mmca2=10006555&cm_mmca3=M12345678&cvosrc=email.Newsletter.M12345678&cvo_campaign=000026UJ&cm_mmc=Email_Newsletter-_-Developer_Ed%2BTech-_-WW_WW-_-SkillsNetwork-Courses-IBMDeveloperSkillsNetwork-PY0101EN-SkillsNetwork-19487395&cm_mmca1=000026UJ&cm_mmca2=10006555&cm_mmca3=M12345678&cvosrc=email.Newsletter.M12345678&cvo_campaign=000026UJ)
-   **claimed_sales_millions** - Album's claimed sales (millions in USD) on [SONG://DATABASE](http://www.song-database.com?cm_mmc=Email_Newsletter-_-Developer_Ed%2BTech-_-WW_WW-_-SkillsNetwork-Courses-IBMDeveloperSkillsNetwork-PY0101EN-SkillsNetwork-19487395&cm_mmca1=000026UJ&cm_mmca2=10006555&cm_mmca3=M12345678&cvosrc=email.Newsletter.M12345678&cvo_campaign=000026UJ)
-   **date_released** - Date on which the album was released
-   **soundtrack** - Indicates if the album is the movie soundtrack (Y) or (N)
-   **rating_of_friends** - Indicates the rating from your friends from 1 to 10
    <br>
    <br>

The dataset can be seen below:

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


<h2 id="list">Lists</h2>


<h3 id="index">Indexing</h3>


We are going to take a look at lists in Python. A list is a sequenced collection of different objects such as integers, strings, and other lists as well. The address of each element within a list is called an <b>index</b>. An index is used to access and refer to items within a list.


<img src="https://s3-api.us-geo.objectstorage.softlayer.net/cf-courses-data/CognitiveClass/PY0101EN/Chapter%202/Images/ListsIndex.png" width="1000" />


 To create a list, type the list within square brackets <b>[ ]</b>, with your content inside the parenthesis and separated by commas. Let’s try it!



```python
# Create a list

L = ["Michael Jackson", 10.1, 1982]
L
```




    ['Michael Jackson', 10.1, 1982]



We can use negative and regular indexing with a list :


<img src="https://s3-api.us-geo.objectstorage.softlayer.net/cf-courses-data/CognitiveClass/PY0101EN/Chapter%202/Images/ListsNeg.png" width="1000" />



```python
# Print the elements on each index

print('the same element using negative and positive indexing:\n Postive:',L[0],
'\n Negative:' , L[-3]  )
print('the same element using negative and positive indexing:\n Postive:',L[1],
'\n Negative:' , L[-2]  )
print('the same element using negative and positive indexing:\n Postive:',L[2],
'\n Negative:' , L[-1]  )
```

    the same element using negative and positive indexing:
     Postive: Michael Jackson 
     Negative: Michael Jackson
    the same element using negative and positive indexing:
     Postive: 10.1 
     Negative: 10.1
    the same element using negative and positive indexing:
     Postive: 1982 
     Negative: 1982


<h3 id="content">List Content</h3>


Lists can contain strings, floats, and integers. We can nest other lists, and we can also nest tuples and other data structures. The same indexing conventions apply for nesting:    



```python
# Sample List

["Michael Jackson", 10.1, 1982, [1, 2], ("A", 1)]
```




    ['Michael Jackson', 10.1, 1982, [1, 2], ('A', 1)]



<h3 id="op">List Operations</h3>


 We can also perform slicing in lists. For example, if we want the last two elements, we use the following command:



```python
# Sample List

L = ["Michael Jackson", 10.1,1982,"MJ",1]
L
```




    ['Michael Jackson', 10.1, 1982, 'MJ', 1]



<img src="https://s3-api.us-geo.objectstorage.softlayer.net/cf-courses-data/CognitiveClass/PY0101EN/Chapter%202/Images/ListsSlice.png" width="1000">



```python
# List slicing

L[3:5]
```




    ['MJ', 1]



We can use the method <code>extend</code> to add new elements to the list:



```python
# Use extend to add elements to list

L = [ "Michael Jackson", 10.2]
L.extend(['pop', 10])
L
```




    ['Michael Jackson', 10.2, 'pop', 10]



Another similar method is <code>append</code>. If we apply <code>append</code> instead of <code>extend</code>, we add one element to the list:



```python
# Use append to add elements to list

L = [ "Michael Jackson", 10.2]
L.append(['pop', 10])
L
```




    ['Michael Jackson', 10.2, ['pop', 10]]



 Each time we apply a method, the list changes. If we apply <code>extend</code> we add two new elements to the list. The list <code>L</code> is then modified by adding two new elements:



```python
# Use extend to add elements to list

L = [ "Michael Jackson", 10.2]
L.extend(['pop', 10])
L
```




    ['Michael Jackson', 10.2, 'pop', 10]



If we append the list  <code>['a','b']</code> we have one new element consisting of a nested list:



```python
# Use append to add elements to list

L.append(['a','b'])
L
```

As lists are mutable, we can change them. For example, we can change the first element as follows:



```python
# Change the element based on the index

A = ["disco", 10, 1.2]
print('Before change:', A)
A[0] = 'hard rock'
print('After change:', A)
```

    Before change: ['disco', 10, 1.2]
    After change: ['hard rock', 10, 1.2]


 We can also delete an element of a list using the <code>del</code> command:



```python
# Delete the element based on the index

print('Before change:', A)
del(A[0])
print('After change:', A)
```

    Before change: ['hard rock', 10, 1.2]
    After change: [10, 1.2]


We can convert a string to a list using <code>split</code>.  For example, the method <code>split</code> translates every group of characters separated by a space into an element in a list:



```python
# Split the string, default is by space

'hard rock'.split()
```




    ['hard', 'rock']



We can use the split function to separate strings on a specific character. We pass the character we would like to split on into the argument, which in this case is a comma.  The result is a list, and each element corresponds to a set of characters that have been separated by a comma: 



```python
# Split the string by comma

'A,B,C,D'.split(',')
```




    ['A', 'B', 'C', 'D']



<h3 id="co">Copy and Clone List</h3>


When we set one variable <b>B</b> equal to <b>A</b>; both <b>A</b> and <b>B</b> are referencing the same list in memory:



```python
# Copy (copy by reference) the list A

A = ["hard rock", 10, 1.2]
B = A
print('A:', A)
print('B:', B)
```

    A: ['hard rock', 10, 1.2]
    B: ['hard rock', 10, 1.2]


<img src="https://s3-api.us-geo.objectstorage.softlayer.net/cf-courses-data/CognitiveClass/PY0101EN/Chapter%202/Images/ListsRef.png" width="1000" align="center">


Initially, the value of the first element in <b>B</b> is set as hard rock. If we change the first element in <b>A</b> to <b>banana</b>, we get an unexpected side effect.  As <b>A</b> and <b>B</b> are referencing the same list, if we change list <b>A</b>, then list <b>B</b> also changes. If we check the first element of <b>B</b> we get banana instead of hard rock:



```python
# Examine the copy by reference

print('B[0]:', B[0])
A[0] = "banana"
print('B[0]:', B[0])
```

    B[0]: hard rock
    B[0]: banana


This is demonstrated in the following figure: 


<img src = "https://s3-api.us-geo.objectstorage.softlayer.net/cf-courses-data/CognitiveClass/PY0101EN/Chapter%202/Images/ListsRefGif.gif" width="1000" />


You can clone list  **A** by using  the following syntax:



```python
# Clone (clone by value) the list A

B = A[:]
B
```




    ['banana', 10, 1.2]



 Variable **B** references a new copy or clone of the original list; this is demonstrated in the following figure:


<img src="https://s3-api.us-geo.objectstorage.softlayer.net/cf-courses-data/CognitiveClass/PY0101EN/Chapter%202/Images/ListsVal.gif" width="1000" />


Now if you change <b>A</b>, <b>B</b> will not change: 



```python
print('B[0]:', B[0])
A[0] = "hard rock"
print('B[0]:', B[0])
```

    B[0]: banana
    B[0]: banana


<h2 id="quiz">Quiz on List</h2>


Create a list <code>a_list</code>, with the following elements <code>1</code>, <code>hello</code>, <code>[1,2,3]</code> and <code>True</code>. 



```python
# Write your code below and press Shift+Enter to execute
a_list=[ 1, "Hello" , [1,2,3], True]
a_list
```




    [1, 'Hello', [1, 2, 3], True]



<details><summary>Click here for the solution</summary>

```python
a_list = [1, 'hello', [1, 2, 3] , True]
a_list

```

</details>


Find the value stored at index 1 of <code>a_list</code>.



```python
# Write your code below and press Shift+Enter to execute
a_list[1]
```




    'Hello'



<details><summary>Click here for the solution</summary>

```python
a_list[1]

```

</details>


Retrieve the elements stored at index 1, 2 and 3 of <code>a_list</code>.



```python
# Write your code below and press Shift+Enter to execute
a_list[1:4]
```




    ['Hello', [1, 2, 3], True]



<details><summary>Click here for the solution</summary>

```python
a_list[1:4]

```

</details>


Concatenate the following lists <code>A = [1, 'a']</code> and <code>B = [2, 1, 'd']</code>:



```python
# Write your code below and press Shift+Enter to execute
A = [1, 'a']
B = [2, 1, 'd']
C=A+B
C
```




    [1, 'a', 2, 1, 'd']



<details><summary>Click here for the solution</summary>

```python
A = [1, 'a'] 
B = [2, 1, 'd']
A + B

```

</details>


<hr>
<h2>The last exercise!</h2>
<p>Congratulations, you have completed your first lesson and hands-on lab in Python. However, there is one more thing you need to do. The Data Science community encourages sharing work. The best way to share and showcase your work is to share it on GitHub. By sharing your notebook on GitHub you are not only building your reputation with fellow data scientists, but you can also show it off when applying for a job. Even though this was your first piece of work, it is never too early to start building good habits. So, please read and follow <a href="https://cognitiveclass.ai/blog/data-scientists-stand-out-by-sharing-your-notebooks/" target="_blank">this article</a> to learn how to share your work.
<hr>


## Author

<a href="https://www.linkedin.com/in/joseph-s-50398b136/" target="_blank">Joseph Santarcangelo</a>

## Other contributors

<a href="www.linkedin.com/in/jiahui-mavis-zhou-a4537814a">Mavis Zhou</a>

## Change Log

| Date (YYYY-MM-DD) | Version | Changed By | Change Description                 |
| ----------------- | ------- | ---------- | ---------------------------------- |
| 2020-08-26        | 2.0     | Lavanya    | Moved lab to course repo in GitLab |
|                   |         |            |                                    |
|                   |         |            |                                    |

## <h3 align="center"> © IBM Corporation 2020. All rights reserved. <h3/>

