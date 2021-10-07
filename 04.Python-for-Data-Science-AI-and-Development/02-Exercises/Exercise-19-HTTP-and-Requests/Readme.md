<a href="https://cognitiveclass.ai/">
    <img src="https://s3-api.us-geo.objectstorage.softlayer.net/cf-courses-data/CognitiveClass/PY0101EN/Ad/CCLog.png" width="200" align="center">
</a>


<h1> HTTP and Requests</h1>

Estimated time needed: **15** minutes

## Objectives

After completing this lab you will be able to:

-   Understand HTTP    
-   Handle the HTTP Requests


<h2>Table of Contents</h2>

<div class="alert alert-block alert-info" style="margin-top: 20px">
    <ul>
        <li>
            <a href="#index">Overview of HTTP </a>
            <ul>
                <li><a href="#HTTP">Uniform Resource Locator:URL</a></li>
                 <li><a href="slice">Request</a></li>
                <li><a href="stride">Response</a></li>
            </ul>
        </li>
        <li>
            <a href="#RP">Requests in Python  </a>
            <ul>
                <li><a href="#get">Get Request with URL Parameters</a></li>
                <li><a href="#post">Post Requests </a></li>

</ul>
    
</div>

<hr>


<h2 id="">Overview of HTTP </h2>


When you, the **client**, use a web page your browser sends an **HTTP** request to the **server** where the page is hosted. The server tries to find the desired **resource** by default  "<code>index.html</code>". If your request is successful, the server will send the object to the client in an **HTTP response**; this includes information like the type of the **resource**, the length of the **resource**, and other information.   

<p>
The figure below represents the process; the circle on the left represents the client, the circle on the right represents the  Web server.  The table under the Web server represents a list of resources stored in the web server. In  this case an <code>HTML</code> file, <code>png</code> image, and <code>txt</code> file .
</p>
<p>
The <b>HTTP</b> protocol allows you to send and receive information through the web including webpages, images, and other web resources. In this lab, we will provide an overview of the Requests library for interacting with the <code>HTTP </code> protocol. 
</p


<div class="alert alert-block alert-info" style="margin-top: 20px">
         <img src="https://s3-api.us-geo.objectstorage.softlayer.net/cf-courses-data/CognitiveClass/PY0101EN/images/reqest_basics.png" width="750" align="center">
   
</div>


<h2 id="URL">Uniform Resource Locator:URL</h2>


Uniform resource locator (URL) is the most popular way to find resources on the web.  We can break the URL into three parts. 

<ul>
    <li><b>scheme</b> this is this protocol, for this lab it will always be <code>http://</code>  </li>
    <li><b> Internet address or  Base URL </b> this will be used to find the location here are some examples: <code>www.ibm.com</code> and  <code> www.gitlab.com </code> </li>
    <li><b>route</b> location on the web server for example: <code>/images/IDSNlogo.png</code> </li>
</ul>


You may also here the term uniform resource identifier (URI), URL are actually a subset of URIs. Another popular term is endpoint, this is the URL of an operation provided by a Web server.


<h2 id="RE">Request </h2>


The process can be broken into the <b>request</b> and <b>response </b> process.  The request using the get method is partially illustrated below. In the start line we have the <code>GET</code> method, this is an <code>HTTP</code> method. Also the location of the resource  <code>/index.html</code> and the <code>HTTP</code> version .The Request header passes additional information with an <code>HTTP</code> request:


<div class="alert alert-block alert-info" style="margin-top: 20px">
         <img src="https://s3-api.us-geo.objectstorage.softlayer.net/cf-courses-data/CognitiveClass/PY0101EN/images/reqest_messege.png" width="400" align="center">
</div>


When an <code>HTTP</code> request is made, an <code>HTTP</code> method is sent, this tells the server what action to perform.  A list of several <code>HTTP</code> methods is shown below. We will go over more examples later.


<div class="alert alert-block alert-info" style="margin-top: 20px">
         <img src="https://s3-api.us-geo.objectstorage.softlayer.net/cf-courses-data/CognitiveClass/PY0101EN/images/http_methods.png" width="400" align="center">
</div>


<h2 id="RES">Response</h2>


The figure below represents the response; the response start line contains the version number <code>HTTP/1.0</code>, a status code (200)  meaning success, followed by a descriptive phrase (OK). The response header contains useful information. Finally, we have the response body containing the requested file an <code> HTML </code> document.  It should be noted that some request have headers.


<div class="alert alert-block alert-info" style="margin-top: 20px">
         <img src="https://s3-api.us-geo.objectstorage.softlayer.net/cf-courses-data/CognitiveClass/PY0101EN/images/response_message.png" width="400" align="center">
</div>


Some status code examples are shown in the table below, the prefix indicates the class; these are shown in yellow, with actual status codes shown in  white. Check out the following  <a href="https://developer.mozilla.org/en-US/docs/Web/HTTP/Status">link </a>  for more descriptions.


<div class="alert alert-block alert-info" style="margin-top: 20px">
         <img src="https://s3-api.us-geo.objectstorage.softlayer.net/cf-courses-data/CognitiveClass/PY0101EN/images/status_code.png" width="300" align="center">
</div>


<h2 id="RP">Requests in Python</h2>


Requests is a python Library that allows you to send <code>HTTP/1.1</code> requests easily.  We can import the library as follows:



```python
import requests
```

We will also use the following libraries 



```python
import os 
from PIL import Image
from IPython.display import IFrame
```

 You can make a <code>GET</code> request via the method <code>get</code> to [www.ibm.com](http://www.ibm.com?cm_mmc=Email_Newsletter-_-Developer_Ed%2BTech-_-WW_WW-_-SkillsNetwork-Courses-IBMDeveloperSkillsNetwork-PY0101EN-SkillsNetwork-19487395&cm_mmca1=000026UJ&cm_mmca2=10006555&cm_mmca3=M12345678&cvosrc=email.Newsletter.M12345678&cvo_campaign=000026UJ&cm_mmc=Email_Newsletter-_-Developer_Ed%2BTech-_-WW_WW-_-SkillsNetwork-Courses-IBMDeveloperSkillsNetwork-PY0101EN-SkillsNetwork-19487395&cm_mmca1=000026UJ&cm_mmca2=10006555&cm_mmca3=M12345678&cvosrc=email.Newsletter.M12345678&cvo_campaign=000026UJ&cm_mmc=Email_Newsletter-_-Developer_Ed%2BTech-_-WW_WW-_-SkillsNetwork-Courses-IBMDeveloperSkillsNetwork-PY0101EN-SkillsNetwork-19487395&cm_mmca1=000026UJ&cm_mmca2=10006555&cm_mmca3=M12345678&cvosrc=email.Newsletter.M12345678&cvo_campaign=000026UJ&cm_mmc=Email_Newsletter-_-Developer_Ed%2BTech-_-WW_WW-_-SkillsNetwork-Courses-IBMDeveloperSkillsNetwork-PY0101EN-SkillsNetwork-19487395&cm_mmca1=000026UJ&cm_mmca2=10006555&cm_mmca3=M12345678&cvosrc=email.Newsletter.M12345678&cvo_campaign=000026UJ&cm_mmc=Email_Newsletter-_-Developer_Ed%2BTech-_-WW_WW-_-SkillsNetwork-Courses-IBMDeveloperSkillsNetwork-PY0101EN-SkillsNetwork-19487395&cm_mmca1=000026UJ&cm_mmca2=10006555&cm_mmca3=M12345678&cvosrc=email.Newsletter.M12345678&cvo_campaign=000026UJ&cm_mmc=Email_Newsletter-_-Developer_Ed%2BTech-_-WW_WW-_-SkillsNetwork-Courses-IBMDeveloperSkillsNetwork-PY0101EN-SkillsNetwork-19487395&cm_mmca1=000026UJ&cm_mmca2=10006555&cm_mmca3=M12345678&cvosrc=email.Newsletter.M12345678&cvo_campaign=000026UJ&cm_mmc=Email_Newsletter-_-Developer_Ed%2BTech-_-WW_WW-_-SkillsNetwork-Courses-IBMDeveloperSkillsNetwork-PY0101EN-SkillsNetwork-19487395&cm_mmca1=000026UJ&cm_mmca2=10006555&cm_mmca3=M12345678&cvosrc=email.Newsletter.M12345678&cvo_campaign=000026UJ&cm_mmc=Email_Newsletter-_-Developer_Ed%2BTech-_-WW_WW-_-SkillsNetwork-Courses-IBMDeveloperSkillsNetwork-PY0101EN-SkillsNetwork-19487395&cm_mmca1=000026UJ&cm_mmca2=10006555&cm_mmca3=M12345678&cvosrc=email.Newsletter.M12345678&cvo_campaign=000026UJ&cm_mmc=Email_Newsletter-_-Developer_Ed%2BTech-_-WW_WW-_-SkillsNetwork-Courses-IBMDeveloperSkillsNetwork-PY0101EN-SkillsNetwork-19487395&cm_mmca1=000026UJ&cm_mmca2=10006555&cm_mmca3=M12345678&cvosrc=email.Newsletter.M12345678&cvo_campaign=000026UJ&cm_mmc=Email_Newsletter-_-Developer_Ed%2BTech-_-WW_WW-_-SkillsNetwork-Courses-IBMDeveloperSkillsNetwork-PY0101EN-SkillsNetwork-19487395&cm_mmca1=000026UJ&cm_mmca2=10006555&cm_mmca3=M12345678&cvosrc=email.Newsletter.M12345678&cvo_campaign=000026UJ): 



```python
url='https://www.ibm.com/'
r=requests.get(url)

```

We have the response object <code>r</code> , this has information about the request, like the status of the request. We  can view the status code using the attribute <code>status_code </code>



```python
r.status_code
```




    200



You can view the request headers:



```python
print(r.request.headers)
```

    {'User-Agent': 'python-requests/2.26.0', 'Accept-Encoding': 'gzip, deflate, br', 'Accept': '*/*', 'Connection': 'keep-alive', 'Cookie': '_abck=7F1BBEFABAD336F5B39CCED9DFF2DF9F~-1~YAAQnmUzuPgO31d8AQAAM8AGWwYJX92eOY6+ZXZm7swaC3ryfHODkYuKzaAgJc5i/lpuIy2Z+Qiv0fLsBhU4NkyPloF51WLXmR5LEqolW1+XqWrNf0qXkXjYvdbUMv0gj29Dmjxm3w9u6WenTsj13ekaaRVlCa1ed/mU0dwquWATiIIkoJHL+iJlrmUuHaTFy5m5ADTjSTIRWbx6wzW8VcGB7LYEasQMWm47jkEPIzRu4OtkGw0y38f9i+0cgztffdbnAqloZeaGlUpiEo7kEJ/rlTBNI5ycsHt0pWVqwrLQNclwF1FfqCQMHG3cG0EKhLK/h0SUmaBUWvtoBY8Xc0f9fm1Z6NYa3fdylvjqQhb2Mcjm2YE=~-1~-1~-1; bm_sz=E66FE3F3DD4E5F697288033D99885CC5~YAAQnmUzuPkO31d8AQAAM8AGWw0OTLEfA/qPr3M+YTwO45t2Xc0x1zSmcKKwTHlW2PnUj48F8IClZpimE4L5sXzJOtriHEQB7nhQWrcv1IlEpbWRbu6rU+zSDNUkm6LJn4pQn9Zh8Uj6bA0TjBzM0Foz5W+DImQAuw/PJ3OsgJm/zirmoRunQaPfQRU46YouP/Zb7XGH7EmtKh3MeNmkCy3mDOOyoH8Ob7zJvQNBZz0ZwTGPefZd3c2TTUdnYE1KnhV0sKfbUiPY6/VV/9iS1cNKLCurskWoDMVftOPJuGM=~3158342~4343105'}


You can view the request body, in the following line, as there is no body for a get request we get a <code>None </code>:



```python
print("request body:", r.request.body)
```

    request body: None


 You can view the <code>HTTP</code> response header using the  attribute <code>headers</code>. This returns a python dictionary of <code>HTTP</code> response headers. 



```python
header=r.headers
print(r.headers)
```

    {'Cache-Control': 'max-age=301', 'Expires': 'Mon, 04 Oct 2021 13:29:36 GMT', 'Last-Modified': 'Fri, 01 Oct 2021 20:47:53 GMT', 'ETag': '"15f2d-5cd50ad61acc1"', 'Accept-Ranges': 'bytes', 'Content-Encoding': 'gzip', 'Content-Type': 'text/html', 'X-Akamai-Transformed': '9 17901 0 pmb=mTOE,1', 'Date': 'Thu, 07 Oct 2021 13:52:21 GMT', 'Content-Length': '17975', 'Connection': 'keep-alive', 'Vary': 'Accept-Encoding', 'x-content-type-options': 'nosniff', 'X-XSS-Protection': '1; mode=block', 'Content-Security-Policy': 'upgrade-insecure-requests', 'Strict-Transport-Security': 'max-age=31536000'}


We can obtain the date the request was sent using the key <code>Date</code>



```python
header['date']
```




    'Thu, 07 Oct 2021 13:52:21 GMT'



<code>Content-Type</code> indicates the type of data:



```python
header['Content-Type']

```




    'text/html'



You can also check the <code>encoding</code>:



```python
 r.encoding
```




    'ISO-8859-1'



As the  <code>Content-Type</code> is <code>text/html</code> we can use the attribute <code>text</code> to display the <code>HTML</code> in the body. We can review the first 100 characters:



```python
r.text[0:100]
```




    '<!DOCTYPE html><html lang="en-US"><head><meta name="viewport" content="width=device-width"/><meta ch'



You can load other types of data for non-text requests like images, consider the URL of the following image:



```python
# Use single quotation marks for defining string
url='https://gitlab.com/ibm/skills-network/courses/placeholder101/-/raw/master/labs/module%201/images/IDSNlogo.png'
```

We can make a get request:



```python
r=requests.get(url)
```

We can look at the response  header:



```python
print(r.headers)
```

    {'Date': 'Thu, 07 Oct 2021 13:52:55 GMT', 'Content-Type': 'image/png', 'Content-Length': '21590', 'Connection': 'keep-alive', 'Cache-Control': 'max-age=60, public', 'Content-Disposition': 'inline', 'Etag': 'W/"56d66205ba3c6cb8fd1418e601bb3ea8"', 'Permissions-Policy': 'interest-cohort=()', 'Referrer-Policy': 'strict-origin-when-cross-origin', 'Vary': 'Accept, Accept-Encoding', 'X-Content-Type-Options': 'nosniff', 'X-Download-Options': 'noopen', 'X-Frame-Options': 'DENY', 'X-Permitted-Cross-Domain-Policies': 'none', 'X-Request-Id': '01FHDGEH82H33YP14A5X05EE2R', 'X-Runtime': '0.068205', 'X-Ua-Compatible': 'IE=edge', 'X-Xss-Protection': '1; mode=block', 'GitLab-LB': 'fe-09-lb-gprd', 'GitLab-SV': 'web-gke-us-east1-b', 'CF-Cache-Status': 'EXPIRED', 'Accept-Ranges': 'bytes', 'Expect-CT': 'max-age=604800, report-uri="https://report-uri.cloudflare.com/cdn-cgi/beacon/expect-ct"', 'Strict-Transport-Security': 'max-age=31536000', 'Server': 'cloudflare', 'CF-RAY': '69a79cdadfab5e60-IAD'}


We can we can see the <code>'Content-Type'</code>



```python
r.headers['Content-Type']
```




    'image/png'



An image is a response object that contains the image as a  <a href="https://docs.python.org/3/glossary.html#term-bytes-like-object">bytes-like object</a>. As a result, we must save it using a file object. First, we specify the file path and
name 



```python
path=os.path.join(os.getcwd(),'image.png')
path
```




    '/resources/labs/image.png'



We save the file, in order to access the body of the response we use the attribute <code>content</code> then save it using the <code>open</code> function and write <code>method</code>: 



```python
with open(path,'wb') as f:
    f.write(r.content)
```

We can view the image:



```python
Image.open(path)  
```




![png](output_55_0.png)



<h3>Question 1: write <a href="https://www.gnu.org/software/wget/"><code> wget </code></a></h3>


In the previous section, we used the <code>wget</code> function to retrieve content from the web server as shown below.  Write the python code to perform the same task. The code should be the same as the one used to download the image, but the file name should be <code>'example.txt'</code>. 


<code>!wget -O /resources/data/Example1.txt <https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-PY0101EN-SkillsNetwork/labs/Module%205/data/Example1.txt></code>



```python
url="https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-PY0101EN-SkillsNetwork/labs/Module%205/data/Example1.txt"
path=os.path.join(os.getcwd(),'example1.txt')
r=requests.get(url)
with open(path,'wb') as f:
    f.write(r.content)
```

<details><summary>Click here for the solution</summary>

```python
url='https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-PY0101EN-SkillsNetwork/labs/Module%205/data/Example1.txt'
path=os.path.join(os.getcwd(),'example1.txt')
r=requests.get(url)
with open(path,'wb') as f:
    f.write(r.content)

```

</details>
 


<h2 id="URL_P">Get Request with URL Parameters </h2>


You can use the <b>GET</b> method  to  modify the results of your query, for example retrieving data from an API .  We send a <b>GET</b> request to the  server. Like before we have the <b>Base URL</b>, in the <b>Route</b>  we append <code>/get</code> this indicates we would like to preform a <code>GET</code> request, this is demonstrated in the following table:


<div class="alert alert-block alert-info" style="margin-top: 20px">
         <img src="https://s3-api.us-geo.objectstorage.softlayer.net/cf-courses-data/CognitiveClass/PY0101EN/images/base_URL_Route.png" width="400" align="center">
</div>


The Base URL is for <code>[http://httpbin.org/](http://httpbin.org?cm_mmc=Email_Newsletter-_-Developer_Ed%2BTech-_-WW_WW-_-SkillsNetwork-Courses-IBMDeveloperSkillsNetwork-PY0101EN-SkillsNetwork-19487395&cm_mmca1=000026UJ&cm_mmca2=10006555&cm_mmca3=M12345678&cvosrc=email.Newsletter.M12345678&cvo_campaign=000026UJ&cm_mmc=Email_Newsletter-_-Developer_Ed%2BTech-_-WW_WW-_-SkillsNetwork-Courses-IBMDeveloperSkillsNetwork-PY0101EN-SkillsNetwork-19487395&cm_mmca1=000026UJ&cm_mmca2=10006555&cm_mmca3=M12345678&cvosrc=email.Newsletter.M12345678&cvo_campaign=000026UJ&cm_mmc=Email_Newsletter-_-Developer_Ed%2BTech-_-WW_WW-_-SkillsNetwork-Courses-IBMDeveloperSkillsNetwork-PY0101EN-SkillsNetwork-19487395&cm_mmca1=000026UJ&cm_mmca2=10006555&cm_mmca3=M12345678&cvosrc=email.Newsletter.M12345678&cvo_campaign=000026UJ)</code> is a simple HTTP Request & Response Service. The <code>URL</code> in Python is given by:



```python
url_get='http://httpbin.org/get'
```

A <a href="https://en.wikipedia.org/wiki/Query_string">query string</a> is a part of a uniform resource locator  (URL),  this sends other information to the web server. The start of the query is a <code>?</code>, followed by a series of parameter and value pairs, as shown in the table below.  The first parameter name is <code>name</code> and the value is <code>Joseph</code> the second parameter name is <code>ID</code>  and the Value is <code>123</code>. Each pair, parameter and value is separated by an equals sign, <code>=</code>.
The series of pairs is separated by the ampersand <code>&</code>.


<div class="alert alert-block alert-info" style="margin-top: 20px">
         <img src="https://s3-api.us-geo.objectstorage.softlayer.net/cf-courses-data/CognitiveClass/PY0101EN/images/query_string.png" width="500" align="center">
</div>


To create a Query string, add a dictionary. The keys are the parameter names, and the values are the value of the Query string.



```python
payload={"name":"Joseph","ID":"123"}
```

Then passing the dictionary <code>payload</code> to the <code>params</code> parameter of the <code> get()</code> function:



```python
r=requests.get(url_get,params=payload)
```

We can print out the <code>URL</code> and see the name and values 



```python
r.url
```




    'http://httpbin.org/get?name=Joseph&ID=123'



There is no request body 



```python
print("request body:", r.request.body)
```

    request body: None


We can print out the status code



```python
print(r.status_code)
```

    200


We can view the response as text:



```python
print(r.text)
```

    {
      "args": {
        "ID": "123", 
        "name": "Joseph"
      }, 
      "headers": {
        "Accept": "*/*", 
        "Accept-Encoding": "gzip, deflate", 
        "Host": "httpbin.org", 
        "User-Agent": "python-requests/2.25.0", 
        "X-Amzn-Trace-Id": "Root=1-6030ecac-02d1b35c1d4ed04a7791ace6"
      }, 
      "origin": "158.85.113.172", 
      "url": "http://httpbin.org/get?name=Joseph&ID=123"
    }
    


We can look at the <code>'Content-Type'</code>.



```python
r.headers['Content-Type']
```




    'application/json'



As the content <code>'Content-Type'</code> is in the <code>JSON</code> format we can use the method <code>json()</code> , it returns a Python  <code>dict</code>:



```python
r.json()
```




    {'args': {'ID': '123', 'name': 'Joseph'},
     'headers': {'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate',
      'Host': 'httpbin.org',
      'User-Agent': 'python-requests/2.25.0',
      'X-Amzn-Trace-Id': 'Root=1-6030ecac-02d1b35c1d4ed04a7791ace6'},
     'origin': '158.85.113.172',
     'url': 'http://httpbin.org/get?name=Joseph&ID=123'}



The  key <code>args</code> had the name and values:



```python
r.json()['args']
```




    {'ID': '123', 'name': 'Joseph'}



<h2 id="POST">Post Requests  </h2>


Like a <code>GET</code> request a <code>POST</code> is used to send data to a server, but the <code>POST</code> request sends the data in a request body. In order to send the Post Request in Python in the <code>URL</code> we change the route to <code>POST</code>:



```python
url_post='http://httpbin.org/post'
```

This endpoint will expect data as a file or as a form, a from is convenient way to configure an HTTP request to send data to a server.


To make a <code>POST</code> request we use the <code>post()</code> function, the variable <code>payload</code>  is passed to the parameter <code> data </code>:



```python
r_post=requests.post(url_post,data=payload)
```

Comparing the URL from the response object of the <code>GET</code> and <code>POST</code> request we see the <code>POST</code> request has no name or value pairs.



```python
print("POST request URL:",r_post.url )
print("GET request URL:",r.url)
```

    POST request URL: http://httpbin.org/post
    GET request URL: http://httpbin.org/get?name=Joseph&ID=123


We can compare the <code>POST</code> and <code>GET</code> request body, we see only the <code>POST</code> request has a body:



```python
print("POST request body:",r_post.request.body)
print("GET request body:",r.request.body)
```

    POST request body: name=Joseph&ID=123
    GET request body: None


We can view the form as well:



```python
r_post.json()['form']
```




    {'ID': '123', 'name': 'Joseph'}



There is a lot more you can do check out <a href="https://requests.readthedocs.io/en/master/">Requests </a> for more.


<hr>


## Authors

<p><a href="https://www.linkedin.com/in/joseph-s-50398b136/" target="_blank">Joseph Santarcangelo</a> <br>A Data Scientist at IBM, and holds a PhD in Electrical Engineering. His research focused on using Machine Learning, Signal Processing, and Computer Vision to determine how videos impact human cognition. Joseph has been working for IBM since he completed his PhD.</p>


### Other Contributors

<a href="www.linkedin.com/in/jiahui-mavis-zhou-a4537814a">Mavis Zhou</a>


## Change Log

| Date (YYYY-MM-DD) | Version | Changed By | Change Description           |
| ----------------- | ------- | ---------- | ---------------------------- |
| 2021-12-20        | 2.1     | Malika     | Updated the links            |
| 2020-09-02        | 2.0     | Simran     | Template updates to the file |
|                   |         |            |                              |
|                   |         |            |                              |

## <h3 align="center"> © IBM Corporation 2020. All rights reserved. <h3/>

