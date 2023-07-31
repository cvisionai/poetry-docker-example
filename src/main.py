import os

from fastapi import FastAPI
from fastapi.responses import FileResponse


app = FastAPI()
index_path = "index.html"
image_dir = "images"
favicon_path = os.path.join(image_dir, "cvisionai.jpeg")

@app.get("/favicon.ico", include_in_schema=False)
async def favicon():
    return FileResponse(favicon_path)


@app.get("/", include_in_schema=False)
async def root():
    return FileResponse(index_path)


@app.get("/image/{image_name}")
async def image(image_name):
    image_path = os.path.join(image_dir, image_name)
    if os.path.isfile(image_path):
        return FileResponse(image_path)
    return {"message": f"{image_name} not found"}, 404
