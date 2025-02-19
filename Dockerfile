FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the Python script into the container
COPY demo.py /app/

# Run the Python script
CMD ["python", "demo.py"]
