# Student Performance Predictor

Predicts a student's math score based on inputs like parental education, lunch type, test preparation, and reading/writing scores. The goal was to see how much these factors actually move the needle on performance.

**Demo:** [Google Drive](https://drive.google.com/file/d/1Wq3GuLAs18fpuO_7WQHGl0tyy2AHsANj/view?usp=sharing)

The app was deployed at: http://student-performance-env.eba-6duwjhzz.eu-north-1.elasticbeanstalk.com/predictdata

## How it works

Training and inference are kept completely separate. Data goes through ingestion, transformation, and model training as independent components. Seven regression models get trained and compared automatically on R² score. The best one gets saved to artifacts along with the preprocessor, and that is what the Flask app loads at runtime.

The seven models: Linear Regression, Decision Tree, Random Forest, Gradient Boosting, AdaBoost, XGBoost, CatBoost. CatBoost and Gradient Boosting ended up on top, around 0.87 R² on test data.

## Deployment

Hosted on AWS Elastic Beanstalk. AWS CodePipeline connects to the GitHub repo so every push to main triggers a fresh deployment automatically. No manual steps after the initial setup.

## Stack

Python, Flask, scikit-learn, XGBoost, CatBoost, Pandas, NumPy, AWS Elastic Beanstalk, AWS CodePipeline.

## What is different from a notebook project

There is a proper logging system, custom exception handling with file and line tracking, and the model selection is fully automated. Nothing is hardcoded. The structure is close to what you would actually build if this were going into a real product.