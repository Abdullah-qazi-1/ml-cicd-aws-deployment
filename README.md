# Student Performance Predictor

An end-to-end machine learning project that predicts a student's math score based on demographic and academic inputs. Built with a modular pipeline and deployed on AWS Elastic Beanstalk.

## What it does

Takes student information like parental education, lunch type, test prep status, and reading/writing scores, then returns a predicted math score. The idea came from wanting to see how much non-academic factors actually influence performance, and whether a model could reliably capture that.

Dataset used: Students Performance in Exams (Kaggle).

## How the pipeline works

Data goes through ingestion, transformation, and training as separate components. Seven regression models are trained at once and evaluated on R² score. Whichever performs best gets saved to artifacts/ along with the preprocessor. That's what the Flask app loads when someone hits the prediction endpoint.

Models trained: Linear Regression, Decision Tree, Random Forest, Gradient Boosting, AdaBoost, XGBoost, CatBoost.

CatBoost and Gradient Boosting consistently came out on top, with R² around 0.87 on the test set.

## Stack

Python, Flask, scikit-learn, XGBoost, CatBoost, Pandas, NumPy. Deployed on AWS Elastic Beanstalk with a GitHub Actions CI/CD pipeline so any push to main goes live automatically.

## What was actually built here

Most ML projects stop at the notebook. This one goes further — custom exception handling, a logging system, proper separation between training and inference, and a working deployment setup. The model selection is automated, meaning no manual comparison or copy-pasting results between notebooks.

It's the kind of setup you'd actually use if this were going into production.