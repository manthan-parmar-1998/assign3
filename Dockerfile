# Use an official Python runtime as a parent image
FROM python:3.12-slim

# Set the working directory
WORKDIR /

# Install necessary utilities and AWS CLI
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    unzip \
    && rm -rf /var/lib/apt/lists/* \
    # Install AWS CLI
    && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && sudo ./aws/install \
    && rm -rf awscliv2.zip

# Copy the current directory contents into the container
COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir flask

# Expose the application port
EXPOSE 80

# Define the command to run the app
CMD ["python", "app.py"]
