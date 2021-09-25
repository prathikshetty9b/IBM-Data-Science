<center>
    <img src="https://gitlab.com/ibm/skills-network/courses/placeholder101/-/raw/master/labs/module%201/images/IDSNlogo.png" width="300" alt="cognitiveclass.ai logo"  />
</center>


# **Exception Handling**

Estimated time needed: **15** minutes

## Objectives

After completing this lab you will be able to:

-   Understand exceptions    
-   Handle the exceptions


## Table of Contents


-   What is an Exception?
-   Exception Handling


* * *


## What is an Exception?


In this section you will learn about what an exception is and see examples of them.


### Definition


An exception is an error that occurs during the execution of code. This error causes the code to raise an exception and if not prepared to handle it will halt the execution of the code.


### Examples


Run each piece of code and observe the exception raised



```python
1/0
```


    ---------------------------------------------------------------------------

    ZeroDivisionError                         Traceback (most recent call last)

    <ipython-input-1-9e1622b385b6> in <module>
    ----> 1 1/0
    

    ZeroDivisionError: division by zero


<code>ZeroDivisionError</code> occurs when you try to divide by zero.



```python
y = a + 5
```


    ---------------------------------------------------------------------------

    NameError                                 Traceback (most recent call last)

    <ipython-input-2-6ddcec040107> in <module>
    ----> 1 y = a + 5
    

    NameError: name 'a' is not defined


<code>NameError</code> in this case means that you tried to use the variable a when it was not defined.



```python
a = [1, 2, 3]
a[10]
```


    ---------------------------------------------------------------------------

    IndexError                                Traceback (most recent call last)

    <ipython-input-3-3f911ca4e3d3> in <module>
          1 a = [1, 2, 3]
    ----> 2 a[10]
    

    IndexError: list index out of range


<code>IndexError</code> in this case occurs when you try to access data from a list using an index that does not exist for this list.


There are many more exceptions that are built into Python, here is a list of them [https://docs.python.org/3/library/exceptions.html](https://docs.python.org/3/library/exceptions.html?cm_mmc=Email_Newsletter-_-Developer_Ed%2BTech-_-WW_WW-_-SkillsNetwork-Courses-IBMDeveloperSkillsNetwork-PY0101EN-SkillsNetwork-19487395&cm_mmca1=000026UJ&cm_mmca2=10006555&cm_mmca3=M12345678&cvosrc=email.Newsletter.M12345678&cvo_campaign=000026UJ&cm_mmc=Email_Newsletter-_-Developer_Ed%2BTech-_-WW_WW-_-SkillsNetwork-Courses-IBMDeveloperSkillsNetwork-PY0101EN-SkillsNetwork-19487395&cm_mmca1=000026UJ&cm_mmca2=10006555&cm_mmca3=M12345678&cvosrc=email.Newsletter.M12345678&cvo_campaign=000026UJ)


## Exception Handling


In this section you will learn how to handle exceptions to perform certain tasks and not halt the execution of your code.


### Try Except


A <code>try except</code> will allow you to execute code that might raise an exception and in the case of any exception or a specific one we can handle or catch the exception and execute specific code. This will allow us to continue the execution of our program even if there is an exception.

Python tries to execute the code in the <code>try</code> block. In this case if there is any exception raised by the code in the <code>try</code> block it will be caught and the code block in the <code>except</code> block will be executed. After the code that comes after the try except will be executed.



```python
# potential code before try catch

try:
    # code to try to execute
except:
    # code to execute if there is an exception
    
# code that will still execute if there is an exception
```


      File "<ipython-input-4-5647baae0eae>", line 5
        except:
             ^
    IndentationError: expected an indented block



### Try Except Example


In this example we are trying to divide a  number given by the user, save the outcome in the variable <code>a</code>, and then we would like to print the result of the operation. When taking user input and dividing a number by it there are a couple of exceptions that can be raised. For example if we divide by zero, try running the following block of code, with <code>b</code> as a number an exception will only be Raised if <code>b</code>, is zero 



```python
a = 1

try:
    b = int(input("Please enter a number to divide a"))
    a = a/b
    print("Success a=",a)
except:
    print("There was an error")
        

```

    Please enter a number to divide a 0


    There was an error


### Try Except Specific


A specific try except allows you to catch certain exceptions and also execute certain code depending on the exception. This is useful if you do not want to deal with some exceptions and the execution should halt, it can also help you find errors in your code that you might not  know about, and it can help you differentiate responses to different exceptions. In this case the code after the try except might not run depending on the error.


<b>do not run, just to illustrate</b>



```python
# potential code before try catch

try:
    # code to try to execute
except (ZeroDivisionError, NameError):
    # code to execute if there is an exception of the given types
    
# code that will execute if there is no exception or a one that we are handling
```


      File "<ipython-input-6-e61cf3848eb0>", line 5
        except (ZeroDivisionError, NameError):
             ^
    IndentationError: expected an indented block




```python
# potential code before try catch

try:
    # code to try to execute
except ZeroDivisionError:
    # code to execute if there is a ZeroDivisionError
except NameError:
    # code to execute if there is a NameError
    
# code that will execute if there is no exception or a one that we are handling
```


      File "<ipython-input-7-22d931ca9af7>", line 5
        except ZeroDivisionError:
             ^
    IndentationError: expected an indented block



You can also have an empty except at the end to catch an unexpected exception:


<b>do not run, just to illustrate</b>



```python
# potential code before try catch

try:
    # code to try to execute
except ZeroDivisionError:
    # code to execute if there is a ZeroDivisionError
except NameError:
    # code to execute if there is a NameError
except:
    # code to execute if ther is any exception
    
# code that will execute if there is no exception or a one that we are handling
```


      File "<ipython-input-8-a22ac9e35695>", line 5
        except ZeroDivisionError:
             ^
    IndentationError: expected an indented block



### Try Except Specific Example


This is the same example as above, but now we will add differentiated messages depending on the exception letting the user know what is wrong with the input.



```python
a = 1

try:
    b = int(input("Please enter a number to divide a"))
    a = a/b
    print("Success a=",a)
except ZeroDivisionError:
    print("The number you provided cant divide 1 because it is 0")
except ValueError:
    print("You did not provide a number")
except:
    print("Something went wrong")
        

```

    Please enter a number to divide a 


    You did not provide a number


### Try Except Else and Finally


<code>else</code> allows one to check if there was no exception when executing the try block. This is useful when we want to execute something only if there were no errors.


<b>do not run, just to illustrate</b>



```python
# potential code before try catch

try:
    # code to try to execute
except ZeroDivisionError:
    # code to execute if there is a ZeroDivisionError
except NameError:
    # code to execute if there is a NameError
except:
    # code to execute if ther is any exception
else:
    # code to execute if there is no exception
    
# code that will execute if there is no exception or a one that we are handling
```


      File "<ipython-input-11-da8d2c055dc5>", line 5
        except ZeroDivisionError:
             ^
    IndentationError: expected an indented block



<code>finally</code> allows us to always execute something even if there is an exception or not. This is usually used to signify the end of the try except.



```python
# potential code before try catch

try:
    # code to try to execute
except ZeroDivisionError:
    # code to execute if there is a ZeroDivisionError
except NameError:
    # code to execute if there is a NameError
except:
    # code to execute if ther is any exception
else:
    # code to execute if there is no exception
finally:
    # code to execute at the end of the try except no matter what
    
# code that will execute if there is no exception or a one that we are handling
```


      File "<ipython-input-12-c3d0b26b117c>", line 5
        except ZeroDivisionError:
             ^
    IndentationError: expected an indented block



### Try Except Else and Finally Example


You might have noticed that even if there is an error the value of a is always printed. Lets use the else and print the value of a only if there is no error.



```python
a = 1

try:
    b = int(input("Please enter a number to divide a"))
    a = a/b
except ZeroDivisionError:
    print("The number you provided cant divide 1 because it is 0")
except ValueError:
    print("You did not provide a number")
except:
    print("Something went wrong")
else:
    print("success a=",a)
```

    Please enter a number to divide a 5


    success a= 0.2


Now lets let the user know that we are done processing their answer. Using the <code>finally</code> lets add a print.



```python
a = 1

try:
    b = int(input("Please enter a number to divide a"))
    a = a/b
except ZeroDivisionError:
    print("The number you provided cant divide 1 because it is 0")
except ValueError:
    print("You did not provide a number")
except:
    print("Something went wrong")
else:
    print("success a=",a)
finally:
    print("Processing Complete")
```

    Please enter a number to divide a 5'


    You did not provide a number
    Processing Complete


## Authors


<a href="https://www.linkedin.com/in/joseph-s-50398b136/" target="_blank">Joseph Santarcangelo</a>


## Change Log

| Date (YYYY-MM-DD) | Version | Changed By | Change Description           |
| ----------------- | ------- | ---------- | ---------------------------- |
| 2020-09-02        | 2.0     | Simran     | Template updates to the file |
|                   |         |            |                              |
|                   |         |            |                              |

## <h3 align="center"> © IBM Corporation 2020. All rights reserved. <h3/>

