
from fastapi import FastAPI, UploadFile, File
from fastapi.responses import JSONResponse
from ultralytics import YOLO
import os


app = FastAPI()

model = YOLO('my_model.pt')

@app.get("/")
async def root():
    return {"message": "YOLOv8 API is working!"}

@app.post("/predict")
async def predict(file: UploadFile = File(...)):
    temp_file = "temp_image.jpg"
    with open(temp_file, "wb") as f:
        f.write(await file.read())

    results = model.predict(source=temp_file, save=False)
    names = model.names
    boxes = results[0].boxes 

    detected_classes = [names[int(box.cls)] for box in boxes]

    os.remove(temp_file)

    return JSONResponse(content={"detections": detected_classes})
