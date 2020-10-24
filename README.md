# Chrissy Cho's AutosRU-s

### Table of Contents
[ 1. Project Overview ](#desc)<br /> 
[ 2. Resources ](#resc)<br /> 
[ 3. Objectives ](#obj)<br /> 
[ 4. Challenge Overview ](#chal)<br /> 
[ 5. Challenge Objective ](#chalsum)<br /> 
[ 6. Final Thoughts ](#find)<br />


<a name="desc"></a>
## Project Overview
In this module, we've learned building a basic neural network and deep learning model. In the later module, we also learned the differences between supervised learning models and neural network models. 

<a name="resc"></a>
## Resources
- Data Source: [AutosRU's MechaCars Prototypes](https://github.com/chrissycho/Deep_Learning/blob/main/challenge/charity_data.csv), [MechaCars suspension coil]
- Software: Jupyter Notebook, Python3 

<a name="obj"></a>
## Objectives
- Describe the differences between supervised and unsupervised learning, including real-world examples of each.
- Preprocess data for unsupervised learning.
- Cluster data using the K-means algorithm.
- Determine the best amount of centroids for K-means using the elbow curve.
- Use PCA to limit features and speed up the model.

<a name="chal"></a>
## Challenge Overview
In this challenge, we have to perform a series of statistical tests and create a technical report that provides interpretation of findings. 

<a name="chalsum"></a>
## Challenge Objective
- Design and interpret a multiple linear regression analysis to identify variables of interest.
- Calculate summary statistics for quantitative variables.
- Perform a t-test in R and provide interpretation of results.
- Design your own statistical study to compare vehicle performance of two vehicles.

<a name="find"></a>
## Final Thoughts
1. How many neurons and layers did you select for your neural network model? Why?
In this model, we've created two hidden layers with 8 neurons and 5 neurons, respectively. This is done by trial and error since adding more neurons do not increase accuracy, the optimal result was shown with 8 and 5 neurons. 

2. Were you able to achieve the target model performance? What steps did you take to try and increase model performance?
At first, we didn't achive the target model performance, which should be higher than 75% accuracy. To increase the accuracy, we've added more neurons and tested the model out. We also added more epochs in the model. The disadvantage with many neurons and more epochs is a risk of overfitting. The disadvantage with more neurons and epochs is a risk of overfitting.  Lastly, we've also tried changing the activation function in the output to tanh but it actually decreased the model so we kept relu in the input and sigmoid in the output. 

3. If you were to implement a different model to solve this classification problem, which would you choose? Why?
If I were to implement a different model to solve the classification problem, I'd compare with other machine learning models such as logistic regression, support vector machine and random forest. Sometimes, logistic regression models can return the output quickly than deep learning models with the same accuracy level.

