# Use slim Python image for a lighter base
FROM python:3.10-slim

# Set working dir
WORKDIR /app

# Copy project files
COPY . .

# Upgrade pip + install dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Expose port 8000 (Railway will map it)
EXPOSE 8000

# Start your FastAPI app
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]

