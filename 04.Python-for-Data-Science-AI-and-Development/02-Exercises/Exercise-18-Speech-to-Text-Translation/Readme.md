<center>
    <img src="https://s3-api.us-geo.objectstorage.softlayer.net/cf-courses-data/CognitiveClass/Logos/organization_logo/organization_logo.png" width="300" alt="cognitiveclass.ai logo"  />
</center>

# Watson Speech to Text Translator

Estimated time needed: **25** minutes

## Objectives

After completing this lab you will be able to:

-   Create Speech to Text Translator


### Introduction

<p>In this notebook, you will learn to convert an audio file of an English speaker to text using a Speech to Text API. Then you will translate the English version to a Spanish version using a Language Translator API. <b>Note:</b> You must obtain the API keys and enpoints to complete the lab.</p>


<div class="alert alert-block alert-info" style="margin-top: 20px">
<h2>Table of Contents</h2>
<ul>
    <li><a href="#ref0">Speech To Text</a></li>
    <li><a href="#ref1">Language Translator</a></li>
    <li><a href="#ref2">Exercise</a></li>
</ul>
</div>



```python
#you will need the following library 
!pip install PyJWT==1.7.1 ibm_watson wget
```

    Requirement already satisfied: PyJWT==1.7.1 in /home/jupyterlab/conda/envs/python/lib/python3.6/site-packages (1.7.1)
    Requirement already satisfied: ibm_watson in /home/jupyterlab/conda/envs/python/lib/python3.6/site-packages (5.1.0)
    Requirement already satisfied: wget in /home/jupyterlab/conda/envs/python/lib/python3.6/site-packages (3.2)
    Requirement already satisfied: websocket-client==0.48.0 in /home/jupyterlab/conda/envs/python/lib/python3.6/site-packages (from ibm_watson) (0.48.0)
    Requirement already satisfied: python-dateutil>=2.5.3 in /home/jupyterlab/conda/envs/python/lib/python3.6/site-packages (from ibm_watson) (2.8.1)
    Requirement already satisfied: requests<3.0,>=2.0 in /home/jupyterlab/conda/envs/python/lib/python3.6/site-packages (from ibm_watson) (2.25.0)
    Requirement already satisfied: ibm-cloud-sdk-core>=3.3.6 in /home/jupyterlab/conda/envs/python/lib/python3.6/site-packages (from ibm_watson) (3.5.2)
    Requirement already satisfied: six in /home/jupyterlab/conda/envs/python/lib/python3.6/site-packages (from websocket-client==0.48.0->ibm_watson) (1.15.0)
    Requirement already satisfied: chardet<4,>=3.0.2 in /home/jupyterlab/conda/envs/python/lib/python3.6/site-packages (from requests<3.0,>=2.0->ibm_watson) (3.0.4)
    Requirement already satisfied: urllib3<1.27,>=1.21.1 in /home/jupyterlab/conda/envs/python/lib/python3.6/site-packages (from requests<3.0,>=2.0->ibm_watson) (1.25.11)
    Requirement already satisfied: certifi>=2017.4.17 in /home/jupyterlab/conda/envs/python/lib/python3.6/site-packages (from requests<3.0,>=2.0->ibm_watson) (2020.12.5)
    Requirement already satisfied: idna<3,>=2.5 in /home/jupyterlab/conda/envs/python/lib/python3.6/site-packages (from requests<3.0,>=2.0->ibm_watson) (2.10)


<h2 id="ref0">Speech to Text</h2>


<p>First we import <code>SpeechToTextV1</code> from <code>ibm_watson</code>.For more information on the API, please click on this <a href="https://cloud.ibm.com/apidocs/speech-to-text?code=python">link</a></p>



```python
from ibm_watson import SpeechToTextV1 
import json
from ibm_cloud_sdk_core.authenticators import IAMAuthenticator
```

<p>The service endpoint is based on the location of the service instance, we store the information in the variable URL. To find out which URL to use, view the service credentials and paste the url here.</p>



```python
url_s2t = "https://api.us-south.speech-to-text.watson.cloud.ibm.com/instances/fb99e26e-703d-4f6d-8337-223fb8e9fe97"
```

<p>You require an API key, and you can obtain the key on the <a href="https://cloud.ibm.com/resources">Dashboard </a>.</p>



```python
iam_apikey_s2t = "JtftS4VR9gdLlDDbq5ptzXpxIkVcL5F2TF51L3hcpc1c"
```

<p>You create a <a href="http://watson-developer-cloud.github.io/python-sdk/v0.25.0/apis/watson_developer_cloud.speech_to_text_v1.html">Speech To Text Adapter object</a> the parameters are the  endpoint and API key.</p>



```python
authenticator = IAMAuthenticator(iam_apikey_s2t)
s2t = SpeechToTextV1(authenticator=authenticator)
s2t.set_service_url(url_s2t)
s2t
```




    <ibm_watson.speech_to_text_v1_adapter.SpeechToTextV1Adapter at 0x7f0b112b6b70>



<p>Lets download the audio file that we will use to convert into text.</p>



```python
!wget -O PolynomialRegressionandPipelines.mp3  https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-PY0101EN-SkillsNetwork/labs/Module%205/data/PolynomialRegressionandPipelines.mp3


```

    --2021-02-20 10:46:31--  https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-PY0101EN-SkillsNetwork/labs/Module%205/data/PolynomialRegressionandPipelines.mp3
    Resolving cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud (cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud)... 169.63.118.104
    Connecting to cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud (cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud)|169.63.118.104|:443... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 4234179 (4.0M) [audio/mpeg]
    Saving to: ‘PolynomialRegressionandPipelines.mp3’
    
    PolynomialRegressio 100%[===================>]   4.04M  4.26MB/s    in 0.9s    
    
    2021-02-20 10:46:32 (4.26 MB/s) - ‘PolynomialRegressionandPipelines.mp3’ saved [4234179/4234179]
    


<p>We have the path of the wav file we would like to convert to text</p>



```python
filename='PolynomialRegressionandPipelines.mp3'
```

<p>We create the file object <code>wav</code> with the wav file using  <code>open</code> ; we set the <code>mode</code> to  "rb" ,  this is similar to read mode, but it ensures the file is in binary mode.We use the method <code>recognize</code> to return the recognized text. The parameter audio is the file object <code>wav</code>, the parameter <code>content_type</code> is the format of the audio file.</p>



```python
with open(filename, mode="rb")  as wav:
    response = s2t.recognize(audio=wav, content_type='audio/mp3')
```

<p>The attribute result contains a dictionary that includes the translation:</p>



```python
response.result
```




    {'result_index': 0,
     'results': [{'final': True,
       'alternatives': [{'transcript': 'in this video we will cover polynomial regression and pipelines ',
         'confidence': 0.94}]},
      {'final': True,
       'alternatives': [{'transcript': "what do we do when a linear model is not the best fit for our data let's look into another type of regression model the polynomial regression we transform our data into a polynomial then use linear regression to fit the parameters that we will discuss pipelines pipelines are way to simplify your code ",
         'confidence': 0.9}]},
      {'final': True,
       'alternatives': [{'transcript': "polynomial regression is a special case of the general linear regression this method is beneficial for describing curvilinear relationships what is a curvilinear relationship it's what you get by squaring or setting higher order terms of the predictor variables in the model transforming the data the model can be quadratic which means the predictor variable in the model is squared we use a bracket to indicated as an exponent this is the second order polynomial regression with a figure representing the function ",
         'confidence': 0.95}]},
      {'final': True,
       'alternatives': [{'transcript': 'the model can be cubic which means the predictor variable is cute this is the third order polynomial regression we see by examining the figure that the function has more variation ',
         'confidence': 0.95}]},
      {'final': True,
       'alternatives': [{'transcript': "there also exists higher order polynomial regressions when a good fit hasn't been achieved by second or third order we can see in figures how much the graphs change when we change the order of the polynomial regression the degree of the regression makes a big difference and can result in a better fit if you pick the right value in all cases the relationship between the variable in the parameter is always linear ",
         'confidence': 0.91}]},
      {'final': True,
       'alternatives': [{'transcript': "let's look at an example from our data we generate a polynomial regression model ",
         'confidence': 0.89}]},
      {'final': True,
       'alternatives': [{'transcript': 'in python we do this by using the poly fit function in this example we develop a third order polynomial regression model base we can print out the model symbolic form for the model is given by the following expression ',
         'confidence': 0.92}]},
      {'final': True,
       'alternatives': [{'transcript': "negative one point five five seven X. one cute plus two hundred four point eight X. one squared plus eight thousand nine hundred sixty five X. one plus one point three seven times ten to the power of five we can also have multi dimensional polynomial linear regression the expression can get complicated here are just some of the terms for two dimensional second order polynomial none pies poly fit function cannot perform this type of regression we use the preprocessing librarian scikit learn to create a polynomial feature object the constructor takes the degree of the polynomial as a parameter then we transform the features into a polynomial feature with the fit underscore transform method let's do a more intuitive example ",
         'confidence': 0.9}]},
      {'final': True,
       'alternatives': [{'transcript': 'consider the feature shown here applying the method we transform the data we now have a new set of features that are transformed version of our original features as that I mention of the data gets larger we may want to normalize multiple features as scikit learn instead we can use the preprocessing module to simplify many tasks for example we can standardize each feature simultaneously we import standard scaler we train the object fit the scale object then transform the data into a new data frame on a rate X. underscore scale there are more normalization methods available in the pre processing library as well as other transformations we can simplify our code by using a pipeline library there are many steps to getting a prediction for example normalization polynomial transform and linear regression we simplify the process using a pipeline ',
         'confidence': 0.9}]},
      {'final': True,
       'alternatives': [{'transcript': 'pipeline sequentially perform a series of transformations the last step carries out a prediction first we import all the modules we need then we import the library pipeline we create a list of topples the first element in the topple contains the name of the estimator model the second element contains model constructor we input the list in the pipeline constructor we now have a pipeline object we can train the pipeline by applying the train method to the pipeline object we can also produce a prediction as well ',
         'confidence': 0.89}]},
      {'final': True,
       'alternatives': [{'transcript': 'the method normalizes the data performs a polynomial transform then outputs a prediction ',
         'confidence': 0.89}]}]}




```python
from pandas.io.json import json_normalize

json_normalize(response.result['results'],"alternatives")
```

    /home/jupyterlab/conda/envs/python/lib/python3.6/site-packages/ipykernel_launcher.py:3: FutureWarning: pandas.io.json.json_normalize is deprecated, use pandas.json_normalize instead
      This is separate from the ipykernel package so we can avoid doing imports until





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
      <th>transcript</th>
      <th>confidence</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>in this video we will cover polynomial regress...</td>
      <td>0.94</td>
    </tr>
    <tr>
      <th>1</th>
      <td>what do we do when a linear model is not the b...</td>
      <td>0.90</td>
    </tr>
    <tr>
      <th>2</th>
      <td>polynomial regression is a special case of the...</td>
      <td>0.95</td>
    </tr>
    <tr>
      <th>3</th>
      <td>the model can be cubic which means the predict...</td>
      <td>0.95</td>
    </tr>
    <tr>
      <th>4</th>
      <td>there also exists higher order polynomial regr...</td>
      <td>0.91</td>
    </tr>
    <tr>
      <th>5</th>
      <td>let's look at an example from our data we gene...</td>
      <td>0.89</td>
    </tr>
    <tr>
      <th>6</th>
      <td>in python we do this by using the poly fit fun...</td>
      <td>0.92</td>
    </tr>
    <tr>
      <th>7</th>
      <td>negative one point five five seven X. one cute...</td>
      <td>0.90</td>
    </tr>
    <tr>
      <th>8</th>
      <td>consider the feature shown here applying the m...</td>
      <td>0.90</td>
    </tr>
    <tr>
      <th>9</th>
      <td>pipeline sequentially perform a series of tran...</td>
      <td>0.89</td>
    </tr>
    <tr>
      <th>10</th>
      <td>the method normalizes the data performs a poly...</td>
      <td>0.89</td>
    </tr>
  </tbody>
</table>
</div>




```python
response
```




    <ibm_cloud_sdk_core.detailed_response.DetailedResponse at 0x7f0b9502ebe0>



<p>We can obtain the recognized text and assign it to the variable <code>recognized_text</code>:</p>



```python
recognized_text=response.result['results'][0]["alternatives"][0]["transcript"]
type(recognized_text)
```




    str



<h2 id="ref1">Language Translator</h2>


<p>First we import <code>LanguageTranslatorV3</code> from ibm_watson. For more information on the API click <a href="https://cloud.ibm.com/apidocs/speech-to-text?code=python"> here</a></p>



```python
from ibm_watson import LanguageTranslatorV3
```

<p>The service endpoint is based on the location of the service instance, we store the information in the variable URL. To find out which URL to use, view the service credentials.</p>



```python
url_lt='https://api.us-south.language-translator.watson.cloud.ibm.com/instances/fc52e60a-d3eb-4dcb-bdeb-882d3eb00687'
```

<p>You require an API key, and you can obtain the key on the <a href="https://cloud.ibm.com/resources">Dashboard</a>.</p>



```python
apikey_lt='hncOZ1zQ84BaLmcqM9v08iHiRJ4XdvV_L_8ukX0zWwTi'
```

<p>API requests require a version parameter that takes a date in the format version=YYYY-MM-DD. This lab describes the current version of Language Translator, 2018-05-01</p>



```python
version_lt='2018-05-01'
```

<p>we create a  Language Translator object <code>language_translator</code>:</p>



```python
authenticator = IAMAuthenticator(apikey_lt)
language_translator = LanguageTranslatorV3(version=version_lt,authenticator=authenticator)
language_translator.set_service_url(url_lt)
language_translator
```




    <ibm_watson.language_translator_v3.LanguageTranslatorV3 at 0x7f0b4c08ac88>



<p>We can get a Lists the languages that the service can identify.
The method Returns the language code.  For example English (en) to  Spanis (es) and name of each language.</p>



```python
from pandas.io.json import json_normalize

json_normalize(language_translator.list_identifiable_languages().get_result(), "languages")
```

    /home/jupyterlab/conda/envs/python/lib/python3.6/site-packages/ipykernel_launcher.py:3: FutureWarning: pandas.io.json.json_normalize is deprecated, use pandas.json_normalize instead
      This is separate from the ipykernel package so we can avoid doing imports until





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
      <th>language</th>
      <th>name</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>af</td>
      <td>Afrikaans</td>
    </tr>
    <tr>
      <th>1</th>
      <td>ar</td>
      <td>Arabic</td>
    </tr>
    <tr>
      <th>2</th>
      <td>az</td>
      <td>Azerbaijani</td>
    </tr>
    <tr>
      <th>3</th>
      <td>ba</td>
      <td>Bashkir</td>
    </tr>
    <tr>
      <th>4</th>
      <td>be</td>
      <td>Belarusian</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>71</th>
      <td>uk</td>
      <td>Ukrainian</td>
    </tr>
    <tr>
      <th>72</th>
      <td>ur</td>
      <td>Urdu</td>
    </tr>
    <tr>
      <th>73</th>
      <td>vi</td>
      <td>Vietnamese</td>
    </tr>
    <tr>
      <th>74</th>
      <td>zh</td>
      <td>Simplified Chinese</td>
    </tr>
    <tr>
      <th>75</th>
      <td>zh-TW</td>
      <td>Traditional Chinese</td>
    </tr>
  </tbody>
</table>
<p>76 rows × 2 columns</p>
</div>



<p>We can use the method <code>translate</code> this will translate the text. The parameter text is the text. Model_id is the type of model we would like to use use we use list the language . In this case, we set it to 'en-es' or English to Spanish. We get a Detailed Response object translation_response</p>



```python
translation_response = language_translator.translate(\
    text=recognized_text, model_id='en-es')
translation_response
```




    <ibm_cloud_sdk_core.detailed_response.DetailedResponse at 0x7f0b4c037630>



<p>The result is a dictionary.</p>



```python
translation=translation_response.get_result()
translation
```




    {'translations': [{'translation': 'en este vídeo cubriremos la regresión polinómica y las tuberías '}],
     'word_count': 10,
     'character_count': 64}



<p>We can obtain the actual translation as a string as follows:</p>



```python
spanish_translation =translation['translations'][0]['translation']
spanish_translation 
```




    'en este vídeo cubriremos la regresión polinómica y las tuberías '



<p>We can translate back to English</p>



```python
translation_new = language_translator.translate(text=spanish_translation ,model_id='es-en').get_result()
```

<p>We can obtain the actual translation as a string as follows:</p>



```python
translation_eng=translation_new['translations'][0]['translation']
translation_eng
```




    'in this video we will cover the polynomial regression and the pipes '



<br>


<h2>Quiz</h2>


Translate to French.



```python
# Write your code below and press Shift+Enter to execute
French_translation=language_translator.translate(
    text=translation_eng , model_id='en-fr').get_result()

French_translation['translations'][0]['translation']
```




    'Dans cette vidéo nous couvrons la régression polynomiale et les tuyaux '



<details><summary>Click here for the solution</summary>

```python
French_translation=language_translator.translate(
    text=translation_eng , model_id='en-fr').get_result()

French_translation['translations'][0]['translation']

```

</details>


<h3>Language Translator</h3>


 <a href="https://cloud.ibm.com/catalog/services/watson-studio"><img src="https://ibm.box.com/shared/static/irypdxea2q4th88zu1o1tsd06dya10go.png" width="750" align="center"></a>


<b>References</b>


[https://cloud.ibm.com/apidocs/speech-to-text?code=python](https://cloud.ibm.com/apidocs/speech-to-text?code=python&cm_mmc=Email_Newsletter-_-Developer_Ed%2BTech-_-WW_WW-_-SkillsNetwork-Courses-IBMDeveloperSkillsNetwork-PY0101EN-SkillsNetwork-19487395&cm_mmca1=000026UJ&cm_mmca2=10006555&cm_mmca3=M12345678&cvosrc=email.Newsletter.M12345678&cvo_campaign=000026UJ)


[https://cloud.ibm.com/apidocs/language-translator?code=python](https://cloud.ibm.com/apidocs/language-translator?code=python&cm_mmc=Email_Newsletter-_-Developer_Ed%2BTech-_-WW_WW-_-SkillsNetwork-Courses-IBMDeveloperSkillsNetwork-PY0101EN-SkillsNetwork-19487395&cm_mmca1=000026UJ&cm_mmca2=10006555&cm_mmca3=M12345678&cvosrc=email.Newsletter.M12345678&cvo_campaign=000026UJ)


<hr>


## Authors:

 [Joseph Santarcangelo](https://www.linkedin.com/in/joseph-s-50398b136?cm_mmc=Email_Newsletter-_-Developer_Ed%2BTech-_-WW_WW-_-SkillsNetwork-Courses-IBMDeveloperSkillsNetwork-PY0101EN-SkillsNetwork-19487395&cm_mmca1=000026UJ&cm_mmca2=10006555&cm_mmca3=M12345678&cvosrc=email.Newsletter.M12345678&cvo_campaign=000026UJ&cm_mmc=Email_Newsletter-_-Developer_Ed%2BTech-_-WW_WW-_-SkillsNetwork-Courses-IBMDeveloperSkillsNetwork-PY0101EN-SkillsNetwork-19487395&cm_mmca1=000026UJ&cm_mmca2=10006555&cm_mmca3=M12345678&cvosrc=email.Newsletter.M12345678&cvo_campaign=000026UJ) 

Joseph Santarcangelo has a PhD in Electrical Engineering, his research focused on using machine learning, signal processing, and computer vision to determine how videos impact human cognition. Joseph has been working for IBM since he completed his PhD.

## Other Contributor(s)

<a href="https://www.linkedin.com/in/fanjiang0619/">Fan Jiang</a>

## Change Log

| Date (YYYY-MM-DD) | Version | Changed By | Change Description                 |
| ----------------- | ------- | ---------- | ---------------------------------- |
| 2021-01-05        | 2.1     | Malika     | Added a library                    |
| 2020-08-26        | 2.0     | Lavanya    | Moved lab to course repo in GitLab |
|                   |         |            |                                    |
|                   |         |            |                                    |

<hr/>

## <h3 align="center"> © IBM Corporation 2020. All rights reserved. <h3/>

