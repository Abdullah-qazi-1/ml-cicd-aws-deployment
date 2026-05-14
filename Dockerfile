# Base image - Python 3.11 (same as AWS deployment)
FROM python:3.11-slim
 
# Set working directory inside container
WORKDIR /app
 
# Copy requirements first (layer caching - fast rebuild)
COPY requirements.txt .
 
# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt
 
# Copy entire project into container
COPY . .
 
# Install the project package (setup.py)
RUN pip install -e .
 
# Expose port 5000 (Flask default)
EXPOSE 5000
 
# Run the app
CMD ["python", "application.py"]
 