FROM python:3.10-slim

WORKDIR /app

# Install system dependencies (including OpenGL for OpenCV)
RUN apt-get update && apt-get install -y \
    libsm6 \
    libxext6 \
    libxrender-dev \
    libgomp1 \
    libgl1-mesa-glx \
    libglib2.0-0 \
    libx11-6 \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements and install
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application
COPY . .

# Expose port for Hugging Face Spaces
EXPOSE 7860

# Run the Flask app
CMD ["python", "app.py"]
