# Base image
FROM python:3.10-slim-bookworm

# Install system packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
 && rm -rf /var/lib/apt/lists/*

# Copy requirements
COPY requirements.txt /requirements.txt

# Install Python dependencies
RUN pip install --no-cache-dir -r /requirements.txt

# Copy project files
COPY . /app
WORKDIR /app

# Start the bot/app
CMD ["python", "bot.py"]
