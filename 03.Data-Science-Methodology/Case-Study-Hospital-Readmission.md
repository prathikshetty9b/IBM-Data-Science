# Problem

### What is the best way to allocate the limited healthcare budget to maximize its use in providing quality care?

This question is one that became a hot topic for an American healthcare insurance provider. As public funding for readmissions was decreasing, this insurance company was at risk of having to make up for the cost difference, which could potentially increase rates for its customers. Knowing that raising insurance rates was not going to be a popular move, the insurance company sat down with the health care authorities in its region and brought in IBM data scientists to see how data science could be applied to the question at hand.

---

# Business Understanding

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/3dc6364f-b170-4c68-9eb7-8e80103a2c7b/Untitled.png)

Before even starting to collect data, the goals and objectives needed to be defined. After spending time to determine the goals and objectives, the team prioritized **"patient readmissions"** as an effective area for review. 

## Examining Hospital Readmissions

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/74445af1-d3db-4304-8fd9-11aa83c96e23/Untitled.png)

With the goals and objectives in mind, it was found that approximately **30% of individual**s who finish rehab treatment would be readmitted to a rehab center within **one year**; and that **50%** would be readmitted within five years. After reviewing some records, it was discovered that the patients with **congestive heart failure** were at the top of the readmission list. It was further determined that a **decision-tree model** could be applied to review this scenario, to determine why this was occurring. 

## Pilot Project Kickoff

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/a44714f9-27b6-4500-8643-4a3c80322e98/Untitled.png)

To gain the business understanding that would guide the analytics team in formulating and performing their first project, the IBM Data scientists, proposed and delivered an on-site workshop to kick things off. The key business sponsors involvement throughout the project was critical, in that the sponsor: Set overall direction Remained engaged and provided guidance. Ensured necessary support, where needed. ****

## Identifying the Business Requirements

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/6bd89b97-d9f1-40ff-b3a3-65dc7ebe212a/Untitled.png)

**Finally, four business requirements were identified for whatever model would be built. Namely:** 

- **Predicting readmission outcomes for those patients with Congestive Heart Failure.**
- **Predicting readmission risk.**
- **Understanding the combination of events that led to the predicted outcome.**
- **Applying an easy-to-understand process to new patients, regarding their readmission risk.**

---

# Analytic Approach

## Decision tree classification

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/2aa740da-f1dc-46b2-a3ce-31cdda0c23c1/Untitled.png)

For the case study, a **decision tree classification model** was used to identify the combination of conditions leading to each patient's outcome. In this approach, examining the variables in each of the nodes along each path to a leaf, led to a respective threshold value. This means the decision tree classifier provides both the predicted outcome, as well as the likelihood of that outcome, based on the proportion at the dominant outcome, yes or no, in each group. 

From this information, the analysts can obtain the readmission risk, or the likelihood of a yes for each patient. If the dominant outcome is yes, then the risk is simply the proportion of yes patients in the leaf. If it is no, then the risk is 1 minus the proportion of no patients in the leaf. 

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/adb0aa17-e3f3-4deb-88cf-7eb1c9fc01eb/Untitled.png)

A decision tree classification model is easy for non-data scientists to understand and apply, to score new patients for their risk of readmission. Clinicians can readily see what conditions are causing a patient to be scored as high-risk and multiple models can be built and applied at various points during hospital stay. This gives a moving picture of the patient's risk and how it is evolving with the various treatments being applied. For these reasons, the decision tree classification approach was chosen for building the Congestive Heart Failure readmission model.

---

# Data Requirement

## Selecting the Cohort

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/d2a143ed-2137-4af9-b561-67b2c1fad85f/Untitled.png)

In the case study, the first task was to define the data requirements for the decision tree classification approach that was selected. This included **selecting a suitable patient cohort** from the health insurance providers member base. In order to compile the complete clinical histories, three criteria were identified for inclusion in the cohort. 

- First, a patient needed to be admitted as in-patient within the provider service area, so they'd have access to the necessary information.
- Second, they focused on patients with a primary diagnosis of congestive heart failure during one full year.
- Third, a patient must have had continuous enrollment for at least six months, prior to the primary admission for congestive heart failure, so that complete medical history could be compiled.
- Congestive heart failure patients who also had been diagnosed as having other significant medical conditions, were excluded from the cohort because those conditions would cause higher-than-average re-admission rates and, thus, could skew the results.

## Defining the Data

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/bebb3849-4aa7-4b8a-88e8-5ae6b07f5dc6/Untitled.png)

Then the content, format, and representations of the data needed for decision tree classification were defined. This modeling technique requires one record per patient, with columns representing the variables in the model. To model the readmission outcome, there needed to be data covering all aspects of the patient's clinical history. This content would include admissions, primary, secondary, and tertiary diagnoses, procedures, prescriptions, and other services provided either during hospitalization or throughout patient/doctor visits. Thus, a particular patient could have thousands of records, representing all their related attributes. To get to the one record per patient format, the data scientists rolled up the transactional records to the patient level, creating a number of new variables to represent that information. This was a job for the data preparation stage, so thinking ahead and anticipating subsequent stages is important.

---

# Data Collection

## Gathering Available Data

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/eee8778a-3c46-4893-9db2-6294befa47b2/Untitled.png)

Collecting data requires that you know the source or, know where to find the data elements that are needed. In the context of our case study, these can include: demographic, clinical and coverage information of patients, provider information, claims records, as well as pharmaceutical and other information related to all the diagnoses of the congestive heart failure patients. For this case study, certain drug information was also needed, but that data source was not yet integrated with the rest of the data sources. This leads to an important point: It is alright to defer decisions about unavailable data, and attempt to acquire it at a later stage. For example, this can even be done after getting some intermediate results from the predictive modeling. If those results suggest that the drug information might be important in obtaining a good model, then the time to try to get it would be invested. As it turned out though, they were able to build a reasonably good model without this drug information. DBAs and programmers often work together to extract data from various sources, and then merge it. This allows for removing redundant data, making it available for the next stage of the methodology, which is data understanding. At this stage, if necessary, data scientists and analytics team members can discuss various ways to better manage their data, including automating certain processes in the database, so that data collection is easier and faster.

## Deferring Inaccessible Data

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/b8f934cb-91db-4663-9323-cd9fa924b9c9/Untitled.png)

 For this case study, certain drug information was also needed, but that data source was not yet integrated with the rest of the data sources. This leads to an important point: It is alright to defer decisions about unavailable data, and attempt to acquire it at a later stage. For example, this can even be done after getting some intermediate results from the predictive modeling. If those results suggest that the drug information might be important in obtaining a good model, then the time to try to get it would be invested. As it turned out though, they were able to build a reasonably good model without this drug information. 

## Merging Data

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/8eb280c3-2098-457a-aa2c-0004bb2caeeb/Untitled.png)

DBAs and programmers often work together to extract data from various sources, and then merge it. This allows for removing redundant data, making it available for the next stage of the methodology, which is data understanding. At this stage, if necessary, data scientists and analytics team members can discuss various ways to better manage their data, including automating certain processes in the database, so that data collection is easier and faster.

---

# Data Understanding

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/2317a7c9-e501-4165-b472-9c9bf07597c6/Untitled.png)

In order to understand the data related to congestive heart failure admissions, descriptive statistics needed to be run against the data columns that would become variables in the model.

- First, these statistics included Hearst, univariates, and statistics on each variable, such as mean, median, minimum, maximum, and standard deviation.
- Second, pairwise correlations were used, to see how closely certain variables were related, and which ones, if any, were very highly correlated, meaning that they would be essentially redundant, thus making only one relevant for modeling.
- Third, histograms of the variables were examined to understand their distributions. Histograms are a good way to understand how values or a variable are distributed, and which sorts of data preparation may be needed to make the variable more useful in a model. For example, for a categorical variable that has too many distinct values to be informative in a model, the histogram would help them decide how to consolidate those values.

## Looking at Data Qualities

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/c3e1e5c1-58bc-4242-899c-64ba30a079b6/Untitled.png)

The univariates, statistics, and histograms are also used to assess data quality. From the information provided, certain values can be re-coded or perhaps even dropped if necessary, such as when a certain variable has missing values. The question then becomes, does "missing" mean anything? Sometimes a missing value might mean "no", or "0" (zero), or at other times it simply means "we don't know". Or, if a variable contains invalid or misleading values, such as a numeric variable called "age" that contains 0 to 100 and also 999, where that "triple-9" actually means "missing", but would be treated as a valid value unless we corrected it. 

## This is an iterative process

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/b41989f2-4f2f-47b2-99dc-437338db915b/Untitled.png)

Initially, the meaning of congestive heart failure admission was decided on the basis of a primary diagnosis of congestive heart failure. But working through the data understanding stage revealed that the initial definition was not capturing all of the congestive heart failure admissions that were expected, based on clinical experience. This meant looping back to the data collection stage and adding secondary and tertiary diagnoses, and building a more comprehensive definition of congestive heart failure admission. This is just one example of the interactive processes in the methodology. The more one works with the problem and the data, the more one learns and therefore the more refinement that can be done within the model, ultimately leading to a better solution to the problem.

---

# Data Preparation

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/f5c7dbbd-bb66-4f43-b29d-14687935247b/Untitled.png)

In the case study, an important first step in the data preparation stage was to actually define congestive heart failure. This sounded easy at first but defining it precisely, was not straightforward. First, the set of diagnosis-related group codes needed to be identified, as congestive heart failure implies certain kinds of fluid buildup. We also needed to consider that congestive heart failure is only one type of heart failure. Clinical guidance was needed to get the right codes for congestive heart failure. 

## Defining Readmissions

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/7e16281b-4804-4f47-92f0-20179b6df5b0/Untitled.png)

The next step involved defining the re-admission criteria for the same condition. The timing of events needed to be evaluated in order to define whether a particular congestive heart failure admission was an initial event, which is called an index admission, or a congestive heart failure-related re-admission. Based on clinical expertise, a time period of 30 days was set as the window for readmission relevant for congestive heart failure patients, following the discharge from the initial admission. 

## Defining CHF Admission

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/13ac5ff3-1b5f-4429-877d-5805d665ad2d/Untitled.png)

Next, the records that were in transactional format were aggregated, meaning that the data included multiple records for each patient. 

## Aggregating Records

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/891943cd-8dea-42b7-b0c9-e0d04fe23d7f/Untitled.png)

Transactional records included professional provider facility claims submitted for physician, laboratory, hospital, and clinical services. Also included were records describing all the diagnoses, procedures, prescriptions, and other information about in-patients and out-patients. A given patient could easily have hundreds or even thousands of these records, depending on their clinical history. 

### Aggregating to patient level

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/e290ed33-a71f-479a-a933-b0acd4c3b95d/Untitled.png)

Then, all the transactional records were aggregated to the patient level, yielding a single record for each patient, as required for the decision-tree classification method that would be used for modeling. As part of the aggregation process, many new columns were created representing the information in the transactions. For example, frequency and most recent visits to doctors, clinics and hospitals with diagnoses, procedures, prescriptions, and so forth. Co-morbidities with congestive heart failure were also considered, such as diabetes, hypertension, and many other diseases and chronic conditions that could impact the risk of re-admission for congestive heart failure. 

## More or Less Data Needed?

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/55b0278b-3318-4a64-88bb-ce061716e4db/Untitled.png)

During discussions around data preparation, a literature review on congestive heart failure was also undertaken to see whether any important data elements were overlooked, such as co-morbidities that had not yet been accounted for. The literature review involved looping back to the data collection stage to add a few more indicators for conditions and procedures. 

## Completing the Data-Set

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/9f945cf3-60bc-4277-9c72-037f22230ac4/Untitled.png)

Aggregating the transactional data at the patient level, meant merging it with the other patient data, including their demographic information, such as age, gender, type of insurance, and so forth. The result was the creation of one table containing a single record per patient, with many columns representing the attributes about the patient in his or her clinical history. These columns would be used as variables in the predictive modeling. 

### Creating new Variables

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/106f9d8d-5074-43b4-a7a8-218d0e0c76e8/Untitled.png)

Here is a list of the variables that were ultimately used in building the model. The dependent variable, or target, was congestive heart failure readmission within 30 days following discharge from a hospitalization for congestive heart failure, with an outcome of either yes or no.

## Using Training Set

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/598e7ad7-8e39-4f51-ac5c-bc933460f9ae/Untitled.png)

 The data preparation stage resulted in a cohort of 2,343 patients meeting all of the criteria for this case study. The cohort was then split into training and testing sets for building and validating the model, respectively.

---

# Modeling

Here, we'll discuss one of the many aspects of model building, in this case, parameter tuning to improve the model. With a prepared training set, the first decision tree classification model for congestive heart failure readmission can be built. We are looking for patients with high-risk readmission, so the outcome of interest will be congestive heart failure readmission equals "yes".

## Analyzing the 1st Model

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/cc2e99f6-dd14-442e-899b-62a64ce61593/Untitled.png)

In this first model, overall accuracy in classifying the yes and no outcomes was 85%. This sounds good, but it represents only 45% of the "yes". The actual readmissions are correctly classified, meaning that the model is not very accurate. 

## How to improve the model?

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/1bd33efe-e21b-48b7-be50-3dbd7da2dfc9/Untitled.png)

The question then becomes: How could the accuracy of the model be improved in predicting the yes outcome? For decision tree classification, the best parameter to adjust is the relative cost of misclassified yes and no outcomes. Think of it like this: When a true, non-readmission is misclassified, and action is taken to reduce that patient's risk, the cost of that error is the wasted intervention. A statistician calls this a type I error, or a false-positive. But when a true readmission is misclassified, and no action is taken to reduce that risk, then the cost of that error is the readmission and all its attended costs, plus the trauma to the patient. This is a type II error, or a false-negative. So we can see that the costs of the two different kinds of misclassification errors can be quite different. For this reason, it's reasonable to adjust the relative weights of misclassifying the yes and no outcomes. The default is 1-to-1, but the decision tree algorithm, allows the setting of a higher value for yes. 

## Analyzing the  2nd Model

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/7caffd4d-7cb2-4fdc-a510-0b49a21f4337/Untitled.png)

For the second model, the relative cost was set at 9-to-1. This is a very high ratio, but gives more insight to the model's behavior. This time the model correctly classified 97% of the yes, but at the expense of a very low accuracy on the no, with an overall accuracy of only 49%. This was clearly not a good model. The problem with this outcome is the large number of false-positives, which would recommend unnecessary and costly intervention for patients, who would not have been re-admitted anyway. Therefore, the data scientist needs to try again to find a better balance between the yes and no accuracies. 

## Analyzing the 3rd Model

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/5d3297ab-8bf9-44c0-9602-c774ab2b4109/Untitled.png)

For the third model, the relative cost was set at a more reasonable 4-to-1. This time 68% accuracy was obtained on only yes, called sensitivity by statisticians, and 85% accuracy on the no, called specificity, with an overall accuracy of 81%. This is the best balance that can be obtained with a rather small training set through adjusting the relative cost of misclassified yes and no outcomes parameter. A lot more work goes into the modeling, of course, including iterating back to the data preparation stage to redefine some of the other variables, so as to better represent the underlying information, and thereby improve the model.

---

# Evaluation

Let's look at one way to find the optimal model through a diagnostic measure based on tuning one of the parameters in model building.

## Misclassification Costs

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/bcf12def-8449-4b3a-b1ba-0cd251b38174/Untitled.png)

Let's look at one way to find the optimal model through a diagnostic measure based on tuning one of the parameters in model building. Specifically we'll see how to tune the relative cost of misclassifying yes and no outcomes. 

## Relative Costs

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/5211fc81-2bb9-4474-8bbb-0cf95c570da5/Untitled.png)

As shown in this table, four models were built with four different relative misclassification costs. 

## True Positives vs False Positives

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/a2414367-78c1-42a4-929e-ed6b2c876bee/Untitled.png)

As we see, each value of this model-building parameter increases the true-positive rate, or sensitivity, of the accuracy in predicting yes, at the expense of lower accuracy in predicting no, that is, an increasing false-positive rate. The question then becomes, which model is best based on tuning this parameter?

## How to Determine the optimal Model?

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/005aba9c-da56-4449-a215-b21628ddd1ad/Untitled.png)

 For budgetary reasons, the risk-reducing intervention could not be applied to most or all congestive heart failure patients, many of whom would not have been readmitted anyway. On the other hand, the intervention would not be as effective in improving patient care as it should be, with not enough high-risk congestive heart failure patients targeted. So, how do we determine which model was optimal? 

### Using ROC Curve

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/4ef6489b-e0e2-4efc-a50c-e869614b327d/Untitled.png)

As you can see on this slide, the optimal model is the one giving the maximum separation between the blue ROC curve relative to the red base line. We can see that model 3, with a relative misclassification cost of 4-to-1, is the best of the 4 models. And just in case you were wondering, ROC stands for receiver operating characteristic curve, which was first developed during World War II to detect enemy aircraft on radar. It has since been used in many other fields as well. Today it is commonly used in machine learning and data mining. 

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/c86a99ae-b3f4-4faa-86e6-e6293069371e/Untitled.png)

The ROC curve is a useful diagnostic tool in determining the optimal classification model. This curve quantifies how well a binary classification model performs, declassifying the yes and no outcomes when some discrimination criterion is varied. In this case, the criterion is a relative misclassification cost. By plotting the true-positive rate against the false-positive rate for different values of the relative misclassification cost, the ROC curve helped in selecting the optimal model.

---

# Deployment

## Understand the Results

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/ff6b3c54-4cb2-4e8a-b4af-43c8642a5376/Untitled.png)

In preparation for solution deployment, the next step was to assimilate the knowledge for the business group who would be designing and managing the intervention program to reduce readmission risk. In this scenario, the business people translated the model results so that the clinical staff could understand how to identify high-risk patients and design suitable intervention actions. The goal, of course, was to reduce the likelihood that these patients would be readmitted within 30 days after discharge. 

## Gathering Application Requirements

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/a6095be7-150f-4904-84f9-55399726a666/Untitled.png)

During the business requirements stage, the Intervention Program Director and her team had wanted an application that would

- provide automated, near real-time risk assessments of congestive heart failure.
- It also had to be easy for clinical staff to use, and preferably through browser-based application on a tablet, that each staff member could carry around.
- This patient data was generated throughout the hospital stay. It would be automatically prepared in a format needed by the model and each patient would be scored near the time of discharge.
- Clinicians would then have the most up-to-date risk assessment for each patient, helping them to select which patients to target for intervention after discharge.

### Additional Requirements?

- As part of solution deployment, the Intervention team would develop and deliver training for the clinical staff.
- Also, processes for tracking and monitoring patients receiving the intervention would have to be developed in collaboration with IT developers and database administrators, so that the results could go through the feedback stage and the model could be refined over time.

## Solution Deployment

### Example 1

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/401808e3-f29e-4333-b562-765ca20908f8/Untitled.png)

This map is an example of a solution deployed through a Cognos application. In this case, the case study was hospitalization risk for patients with juvenile diabetes. Like the congestive heart failure use case, this one used decision tree classification to create a risk model that would serve as the foundation for this application. The map gives an overview of hospitalization risk nationwide, with an interactive analysis of predicted risk by a variety of patient conditions and other characteristics. 

### Example 2

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/bc115bc7-ec0c-4681-a23e-0632827aef62/Untitled.png)

This slide shows an interactive summary report of risk by patient population within a given node of the model, so that clinicians could understand the combination of conditions for this subgroup of patients. 

### Example 3

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/bf0beca0-dcab-4724-a34c-c412864faaa0/Untitled.png)

And this report gives a detailed summary on an individual patient, including the patient's predicted risk and details about the clinical history, giving a concise summary for the doctor.

---

# Feedback

## Assessing Model Performance

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/0b5410d7-c73f-42c7-9422-77bf8c149444/Untitled.png)

The plan for the feedback stage included these steps: 

- First, the review process would be defined and put into place, with overall responsibility for measuring the results of a "flying to risk" model of the congestive heart failure risk population. Clinical management executives would have overall responsibility for the review process.
- Second, congestive heart failure patients receiving intervention would be tracked and their re-admission outcomes recorded.
- Third, the intervention would then be measured to determine how effective it was in reducing re-admissions. For ethical reasons, congestive heart failure patients would not be split into controlled and treatment groups. Instead, readmission rates would be compared before and after the implementation of the model to measure its impact.

## Refinement

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/434a067c-4154-4b77-a141-9dfb8ab2082a/Untitled.png)

- After the deployment and feedback stages, the impact of the intervention program on re-admission rates would be reviewed after the first year of its implementation.
- Then the model would be refined, based on all of the data compiled after model implementation and the knowledge gained throughout these stages.
- Other refinements included: Incorporating information about participation in the intervention program.
- And possibly refining the model to incorporate detailed pharmaceutical data. If you recall, data collection was initially deferred because the pharmaceutical data was not readily available at the time. But after feedback and practical experience with the model, it might be determined that adding that data could be worth the investment of effort and time.
- We also have to allow for the possibility that other refinements might present themselves during the feedback stage. Also, the intervention actions and processes would be reviewed and very likely refined as well, based on the experience and knowledge gained through initial deployment and feedback.

## Redeployment

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/1cb3617d-f274-4c8a-bf9d-9c932fb3ee0e/Untitled.png)

Finally, the refined model and intervention actions would be redeployed, with the feedback process continued throughout the life of the Intervention program
