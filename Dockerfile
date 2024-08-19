FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the application code into the container
COPY . .

# Install the PostgreSQL development packages
RUN apt-get update && apt-get install -y \
    gcc \
    libpq-dev

# Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port the app runs on
EXPOSE 80

# Command to run the application
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:80", "app:app"]