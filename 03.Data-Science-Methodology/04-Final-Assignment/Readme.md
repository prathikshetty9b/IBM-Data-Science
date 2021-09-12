# Instructions

In this Assignment, you will demonstrate your understanding of the data science methodology by applying it to a given problem. Pick one of the following topics to apply the data science methodology to:

1. Emails
2. Hospitals
3. Credit Cards

You will have to play the role of the client as well as the data scientist to come up with a problem that is more specific but related to these topics.

Please note that this assignment is worth 10% of your final grade.

# My Submissions

## Question 01

**Which topic did you choose to apply the data science methodology to? (2 marks)**

**My Submission:** 

 Credit Cards

## Question 02

Next, you will play the role of the client and the data scientist.

Using the topic that you selected, complete the Business Understanding stage by coming up with a problem that you would like to solve and phrasing it in the form of a question that you will use data to answer. **(3 marks)**

You are required to:

1. **Describe the problem, related to the topic you selected.**
2. **Phrase the problem as a question to be answered using data.**

For example, using the food recipes use case discussed in the labs, the question that we defined was, "Can we automatically determine the cuisine of a given dish based on its ingredients?".

**My Submission:**

1. **What is the best way detect Credit Card frauds without spending too much resources?**

2. **How can we use Data to detect Credit Card frauds effectively?**

## Question 03

Briefly explain how you would complete each of the following stages for the problem that you described in the Business Understanding stage, so that you are ultimately able to answer the question that you came up with. **(5 marks)**:

1. **Analytic Approach**
2. **Data Requirements**
3. **Data Collection**
4. **Data Understanding and Preparation**
5. **Modeling and Evaluation**

You can always refer to the labs as a reference with describing how you would complete each stage for your problem.

**My Submission:**

1.  **Analytic Approach** - For this problem we can use Predictive Model to predict whether the credit card transaction is Fraud or not. How we go about this is by creating a Decision tree to find out combination of conditions leading to Credit card Frauds.
2. **Data Requirements:** Customers credit card transaction details, information like place of transaction, time of transaction, amount transacted are some of key data needed to detect Frauds.
3. **Data Collection:** After data needed for the problem is decided from the Data Requirement stage data is collected from reliable sources , Techniques such as descriptive statistics and visualization can be applied to the data set, to assess the content, quality, and initial insights about the data.
4. **Data Understanding** and Preparation: In this stage we will try to understand whether the collected data would solve the problem at hand that is whether it would be useful in detecting credit card frauds. We would also check for any redundant data, missing data etc. Data understanding is followed by data preparation where data is transformed using various transformation methods making the data easier to work with. This is the most time consuming stage.
5. **Modeling and Evaluation:** Here using a pre determined training set first decision tree model for Fraud Detection is built. Next we would evaluate how the model is performing, if the data scientist finds the result from the model satisfactory the model is deployed ,if not then its looped back to modeling stage. Modeling, evaluation, deployment is a iterative process.