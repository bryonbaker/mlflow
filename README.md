# mlFlow

This repo contais my implementation of mlFlow in a container.

# Building the Image

`podman build -t mlflow:latest .`

# Running in Podman or Docker

`podman run -d --rm --name mlflow -p 5000:5000 mlflow:latest`

