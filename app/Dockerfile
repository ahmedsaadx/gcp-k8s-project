FROM python:3.7



# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install the required packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt


# Expose port 5000 for Flask to listen on
EXPOSE 8000

# Define the command to run the application
ENTRYPOINT [ "python3", "hello.py"]
