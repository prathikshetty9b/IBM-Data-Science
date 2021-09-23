<center>
    <img src="https://s3-api.us-geo.objectstorage.softlayer.net/cf-courses-data/CognitiveClass/Logos/organization_logo/organization_logo.png" width="300" alt="cognitiveclass.ai logo"  />
</center>

# String Operations

Estimated time needed: **15** minutes

## Objectives

After completing this lab you will be able to:

-   Work with Strings    
-   Perform operations on String
-   Manipulate Strings using indexing and escape sequences


<h2>Table of Contents</h2>
<div class="alert alert-block alert-info" style="margin-top: 20px">
    <ul>
        <li>
            <a href="#strings">What are Strings?</a>
        </li>
        <li>
            <a href="#index">Indexing</a>
            <ul>
                <li><a href="neg">Negative Indexing</a></li>
                <li><a href="slice">Slicing</a></li>
                <li><a href="stride">Stride</a></li>
                <li><a href="concat">Concatenate Strings</a></li>
            </ul>
        </li>
        <li>
            <a href="#escape">Escape Sequences</a>
        </li>
        <li>
            <a href="#operations">String Operations</a>
        </li>
        <li>
            <a href="#quiz">Quiz on Strings</a>
        </li>
    </ul>
   
</div>

<hr>


<h2 id="strings">What are Strings?</h2>


The following example shows a string contained within 2 quotation marks:



```python
# Use quotation marks for defining string

"Michael Jackson"
```




    'Michael Jackson'



We can also use single quotation marks:



```python
# Use single quotation marks for defining string

'Michael Jackson'
```




    'Michael Jackson'



A string can be a combination of spaces and digits: 



```python
# Digitals and spaces in string

'1 2 3 4 5 6 '
```




    '1 2 3 4 5 6 '



A string can also be a combination of special characters : 



```python
# Special characters in string

'@#2_#]&*^%$'
```




    '@#2_#]&*^%$'



We can print our string using the print statement:



```python
# Print the string

print("hello!")
```

    hello!


We can bind or assign a string to another variable:



```python
# Assign string to variable

name = "Michael Jackson"
name
```




    'Michael Jackson'



<hr>


<h2 id="index">Indexing</h2>


It is helpful to think of a string as an ordered sequence. Each element in the sequence can be accessed using an index represented by the array of numbers:  


<img src="https://s3-api.us-geo.objectstorage.softlayer.net/cf-courses-data/CognitiveClass/PY0101EN/Chapter%201/Images/StringsIndex.png" width="600" align="center" />


 The first index can be accessed as follows:


<hr/>
<div class="alert alert-success alertsuccess" style="margin-top: 20px">
[Tip]: Because indexing starts at 0, it means the first index is on the index 0.
</div>
<hr/>



```python
# Print the first element in the string

print(name[0])
```

    M


 We can access index 6:



```python
# Print the element on index 6 in the string

print(name[6])
```

    l


Moreover, we can access the 13th index:



```python
# Print the element on the 13th index in the string

print(name[13])
```

    o


<h3 id="neg">Negative Indexing</h3>


 We can also use negative indexing with strings:


<img src="https://s3-api.us-geo.objectstorage.softlayer.net/cf-courses-data/CognitiveClass/PY0101EN/Chapter%201/Images/StringsNeg.png" width="600" align="center" />


Negative index can help us to count the element from the end of the string.


The last element is given by the index -1: 



```python
# Print the last element in the string

print(name[-1])
```

    n


 The first element can be obtained by  index -15:



```python
# Print the first element in the string

print(name[-15])
```

    M


We can find the number of characters in a string by using <code>len</code>, short for length:



```python
# Find the length of string

len("Michael Jackson")
```




    15



<h3 id="slice">Slicing</h3>


We can obtain multiple characters from a string using slicing, we can obtain the 0 to 4th and 8th to the 12th element:  


<img src="https://s3-api.us-geo.objectstorage.softlayer.net/cf-courses-data/CognitiveClass/PY0101EN/Chapter%201/Images/StringsSlice.png" width="600" align="center" />


<hr/>
<div class="alert alert-success alertsuccess" style="margin-top: 20px">
[Tip]: When taking the slice, the first number means the index (start at 0), and the second number means the length from the index to the last element you want (start at 1)
</div>
<hr/>



```python
# Take the slice on variable name with only index 0 to index 3

name[0:4]
```




    'Mich'




```python
# Take the slice on variable name with only index 8 to index 11

name[8:12]
```




    'Jack'



<h3 id="stride">Stride</h3>


 We can also  input a stride value as follows, with the '2' indicating that we are selecting every second variable:


<img src="https://s3-api.us-geo.objectstorage.softlayer.net/cf-courses-data/CognitiveClass/PY0101EN/Chapter%201/Images/StringsStride.png" width="600" align="center" />



```python
# Get every second element. The elments on index 1, 3, 5 ...

name[::2]
```




    'McalJcsn'



We can also incorporate slicing  with the stride. In this case, we select the first five elements and then use the stride: 



```python
# Get every second element in the range from index 0 to index 4

name[0:5:2]
```




    'Mca'



<h3 id="concat">Concatenate Strings</h3>


We can concatenate or combine strings by using the addition symbols, and the result is a new string that is a combination of both:



```python
# Concatenate two strings

statement = name + "is the best"
statement
```




    'Michael Jacksonis the best'



To replicate values of a string we simply multiply the string by the number of times we would like to replicate it. In this case, the number is three. The result is a new string, and this new string consists of three copies of the original string:



```python
# Print the string for 3 times

3 * "Michael Jackson"
```




    'Michael JacksonMichael JacksonMichael Jackson'



You can create a new string by setting it to the original variable. Concatenated  with a new string, the result is a new string that changes from Michael Jackson to “Michael Jackson is the best".



```python
# Concatenate strings

name = "Michael Jackson"
name = name + " is the best"
name
```




    'Michael Jackson is the best'



<hr>


<h2 id="escape">Escape Sequences</h2>


Back slashes represent the beginning  of escape sequences. Escape sequences represent strings that may be difficult to input. For example, back slash "n" represents a new line. The output is given by a new line after the back slash "n" is encountered:



```python
# New line escape sequence

print(" Michael Jackson \n is the best" )
```

     Michael Jackson 
     is the best


Similarly, back slash  "t" represents a tab: 



```python
# Tab escape sequence

print(" Michael Jackson \t is the best" )
```

     Michael Jackson 	 is the best


 If you want to place a back slash in your string, use a double back slash:



```python
# Include back slash in string

print(" Michael Jackson \\ is the best" )
```

     Michael Jackson \ is the best


 We can also place an "r" before the string to display the backslash:



```python
# r will tell python that string will be display as raw string

print(r" Michael Jackson \ is the best" )
```

     Michael Jackson \ is the best


<hr>


<h2 id="operations">String Operations</h2>


There are many string operation methods in Python that can be used to manipulate the data. We are going to use some basic string operations on the data. 


Let's try with the method <code>upper</code>; this method converts lower case characters to upper case characters:



```python
# Convert all the characters in string to upper case

a = "Thriller is the sixth studio album"
print("before upper:", a)
b = a.upper()
print("After upper:", b)
```

    before upper: Thriller is the sixth studio album
    After upper: THRILLER IS THE SIXTH STUDIO ALBUM


The method <code>replace</code> replaces a segment of the string, i.e. a substring  with a new string. We input the part of the string we would like to change. The second argument is what we would like to exchange the segment with, and the result is a new string with the segment changed: 



```python
# Replace the old substring with the new target substring is the segment has been found in the string

a = "Michael Jackson is the best"
b = a.replace('Michael', 'Janet')
b
```




    'Janet Jackson is the best'



The method <code>find</code> finds a sub-string. The argument is the substring you would like to find, and the output is the first index of the sequence. We can find the sub-string <code>jack</code> or <code>el<code>.  


<img src="https://s3-api.us-geo.objectstorage.softlayer.net/cf-courses-data/CognitiveClass/PY0101EN/Chapter%201/Images/StringsFind.png" width="600" align="center" />



```python
# Find the substring in the string. Only the index of the first elment of substring in string will be the output

name = "Michael Jackson"
name.find('el')
```




    5




```python
# Find the substring in the string.

name.find('Jack')
```




    8



If the  sub-string is not in the string then the output is a negative one. For example, the string 'Jasdfasdasdf' is not a substring:



```python
# If cannot find the substring in the string

name.find('Jasdfasdasdf')
```




    -1



<hr>


<h2 id="quiz">Quiz on Strings</h2>


What is the value of the variable <code>a</code> after the following code is executed? 



```python
# Write your code below and press Shift+Enter to execute 

a = "1"
a
```




    '1'



<details><summary>Click here for the solution</summary>

```python
"1"

```

</details>


What is the value of the variable <code>b</code> after the following code is executed?



```python
# Write your code below and press Shift+Enter to execute

b = "2"
b
```




    '2'



<details><summary>Click here for the solution</summary>

```python
"2"

```

</details>


What is the value of the variable <code>c</code> after the following code is executed?



```python
# Write your code below and press Shift+Enter to execute 

c = a + b
c
```




    '12'



<details><summary>Click here for the solution</summary>

```python
"12"

```

</details>


<hr>


Consider the variable <code>d</code> use slicing to print out the first three elements:



```python
# Write your code below and press Shift+Enter to execute

d = "ABCDEFG"
print(d[:3])
```

    ABC


<details><summary>Click here for the solution</summary>

```python
print(d[:3]) 

# or 

print(d[0:3])

```

</details>


<hr>


Use a stride value of 2 to print out every second character of the string <code>e</code>: 



```python
# Write your code below and press Shift+Enter to execute

e = 'clocrkr1e1c1t'
print(e[::2])
```

    correct


<details><summary>Click here for the solution</summary>

```python
print(e[::2])

```

</details>


<hr>


Print out a backslash:



```python
# Write your code below and press Shift+Enter to execute
print(r"\ ")
```

    \ 


<details><summary>Click here for the solution</summary>

```python
print("\\\\")

or

print(r"\ ")

```

</details>


<hr>


Convert the variable <code>f</code> to uppercase:



```python
# Write your code below and press Shift+Enter to execute

f = "You are wrong"
f.upper()
```




    'YOU ARE WRONG'



<details><summary>Click here for the solution</summary>

```python
f.upper()

```

</details>


<hr>


Consider the variable <code>g</code>, and find the first index of the sub-string <code>snow</code>:



```python
# Write your code below and press Shift+Enter to execute

g = "Mary had a little lamb Little lamb, little lamb Mary had a little lamb \
Its fleece was white as snow And everywhere that Mary went Mary went, Mary went \
Everywhere that Mary went The lamb was sure to go"
g.find("snow")
```




    95



<details><summary>Click here for the solution</summary>

```python
g.find("snow")

```

</details>


In the variable <code>g</code>, replace the sub-string <code>Mary</code> with <code>Bob</code>:



```python
# Write your code below and press Shift+Enter to execute
g.replace("Mary","Bob")
```




    'Bob had a little lamb Little lamb, little lamb Bob had a little lamb Its fleece was white as snow And everywhere that Bob went Bob went, Bob went Everywhere that Bob went The lamb was sure to go'



<details><summary>Click here for the solution</summary>

```python
g.replace("Mary", "Bob")

```

</details>


<hr>
<h2>The last exercise!</h2>
<p>Congratulations, you have completed your first lesson and hands-on lab in Python. However, there is one more thing you need to do. The Data Science community encourages sharing work. The best way to share and showcase your work is to share it on GitHub. By sharing your notebook on GitHub you are not only building your reputation with fellow data scientists, but you can also show it off when applying for a job. Even though this was your first piece of work, it is never too early to start building good habits. So, please read and follow <a href="https://cognitiveclass.ai/blog/data-scientists-stand-out-by-sharing-your-notebooks/" target="_blank">this article</a> to learn how to share your work.
<hr>


## Author

<a href="https://www.linkedin.com/in/joseph-s-50398b136/" target="_blank">Joseph Santarcangelo</a>

## Change Log

| Date (YYYY-MM-DD) | Version | Changed By | Change Description                  |
| ----------------- | ------- | ---------- | ----------------------------------- |
| 2020-11-11        | 2.1     | Aije       | Updated variable names to lowercase |
| 2020-08-26        | 2.0     | Lavanya    | Moved lab to course repo in GitLab  |

## <h3 align="center"> © IBM Corporation 2020. All rights reserved. <h3/>



```python

```
