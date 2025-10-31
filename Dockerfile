FROM python:3.11-slim

WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the notifier script and entrypoint
COPY notifier.py .
COPY docker-entrypoint.sh .

# Make entrypoint executable
RUN chmod +x docker-entrypoint.sh

# Create directories for logs and state files
RUN mkdir -p /app/data /app/logs

# Use entrypoint script to handle environment variables
ENTRYPOINT ["/app/docker-entrypoint.sh"]

