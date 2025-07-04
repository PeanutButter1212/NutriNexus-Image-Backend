# Slim Python image to keep it small size so wont exceed limit
FROM python:3.10-slim

FROM python:3.10-slim

# Install system libraries for OpenCV + PyTorch + YOLO + Ultralytics
RUN apt-get update && \
    apt-get install -y libgl1 libglib2.0-0 && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

EXPOSE 8000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]



