# Student Performance Predictor

Predicts a student's math score based on inputs like parental education, lunch type, test preparation, and reading/writing scores. The goal was to see how much these factors actually move the needle on performance.

**Demo:** [Google Drive](https://drive.google.com/file/d/1Wq3GuLAs18fpuO_7WQHGl0tyy2AHsANj/view?usp=sharing)

## App

![App Home](screenshots/app-home.png)

## How it works

Training and inference are kept completely separate. Data goes through ingestion, transformation, and model training as independent components. Seven regression models get trained and compared automatically on R² score. The best one gets saved to artifacts along with the preprocessor, and that is what the Flask app loads at runtime.

The seven models: Linear Regression, Decision Tree, Random Forest, Gradient Boosting, AdaBoost, XGBoost, CatBoost. CatBoost and Gradient Boosting ended up on top, around 0.87 R² on test data.

## Deployment

Previously hosted on AWS Elastic Beanstalk with AWS CodePipeline. Migrated to a full CI/CD pipeline using GitHub Actions, AWS ECR, and AWS EC2.

Every push to main triggers the pipeline automatically:
- **CI** — code checkout and lint check
- **CD (Build)** — Docker image built and pushed to AWS ECR (private registry)
- **CD (Deploy)** — EC2 self-hosted runner pulls latest image and runs the container

![CI/CD Pipeline](screenshots/cicd-pipeline.png)

![Docker Running on EC2](screenshots/docker-running.png)

## Stack

Python, Flask, scikit-learn, XGBoost, CatBoost, Pandas, NumPy, Docker, AWS ECR, AWS EC2, GitHub Actions.

## What is different from a notebook project

There is a proper logging system, custom exception handling with file and line tracking, and the model selection is fully automated. Nothing is hardcoded. The structure is close to what you would actually build if this were going into a real product.