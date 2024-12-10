# Use an official Python runtime as a parent image
FROM python:3.12-slim

# Set the working directory
WORKDIR /

# Install dependencies and required utilities
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl && \
    rm -rf /var/lib/apt/lists/*

# Copy the current directory contents into the container
COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir flask

# Expose the application port
EXPOSE 80

# Define the command to run the app
CMD ["python", "app.py"]
