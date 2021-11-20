"""Modified from https://dev.to/okteto/building-and-deploying-a-fastapi-application-in-okteto-cloud-15d5."""
from uuid import uuid4
import platform
from fastapi import FastAPI

app = FastAPI(title="okteo api")

@app.get("/", tags=["Home"])
def get_root() -> dict:
    return {
            "message": f"Welcome to the okteto's app... node: {platform.node()}, {uuid4().__str__()}"
    }

@app.post("/", tags=["Home"])
def post_root() -> dict:
    return {
            "message": f"Welcome to the okteto's app. (node: {platform.node()} post {uuid4().__str__()})"
    }
