# Docker Bake Build Example

This repository showcases the use of Docker Bake to build Docker images for a full-stack application.
The primary focus is on demonstrating Docker Bake's capabilities for streamlining builds, specifically how to define and manage build targets with `docker-bake.hcl`.

## Project Overview
This project uses Docker Bake to manage the build process for a simple full-stack application (React frontend, Node.js backend). It demonstrates how to define build targets and group them for efficient builds.

## Key Components

* **Docker Bake:** Usage of `docker-bake.hcl` to define build targets and groups.
* **Target Definition:** Defining individual build targets for the frontend and backend.
* **Target Grouping:** Grouping targets for simultaneous builds.
* **Container Registry Integration:** Pushing Docker images to a container registry.

## Technologies Used

* Docker
* Docker Bake
* Docker Hub (or any container registry)

## Prerequisites

* Docker installed and running.
* Docker Hub account (or another container registry).

## Getting Started

1.  **Clone the Repository:**
```shell
git clone https://github.com/CalebAckom/docker-bake-fullstack-example.git
cd docker-bake-fullstack-example
```

2.  **Configure Docker Bake:**

Open `docker-bake.hcl` and replace `calebackom` with your Docker Hub username.

3.  **Build and Push Docker Images:**

- Execute the following command to build and push the images:
```shell
docker buildx bake frontend --push
docker buildx bake backend --push
```
- To build all defined targets at once using the group, you can execute:
```shell
docker buildx bake all --push
```

NB: The `--push` flag is used to push the built images to the container registry. Omit it if you don't want to push the images.

4.  **Run the Application:**
- Run the backend container:
```shell
docker run -d -p 8000:8000 --name backend calebackom/task-backend:latest
```
- Run the frontend container:
```shell
docker run -d -p 3000:80 --name frontend calebackom/task-frontend:latest
```

* Open your browser and navigate to `http://localhost:3000`.

5. To verify that the images are multi-architecture, you can inspect the image manifest:
```shell
docker manifest inspect calebackom/task-backend:latest
docker manifest inspect calebackom/task-frontend:latest
```

## Key Files and Their Purpose

* `docker-bake.hcl`: Defines the Docker Bake build targets, groups, and tags. This file is the primary focus of this repository.
* `backend/Dockerfile`: Dockerfile for the Node.js backend.
* `frontend/Dockerfile`: Dockerfile for the React frontend.

## Focus on Docker Bake

This repository emphasizes the practical application of Docker Bake for managing build targets and groups. The application's functionality is secondary, serving as a demonstration platform for Docker Bake's capabilities.

## Enhancements

* Explore advanced Docker Bake features (build arguments, labels, etc.).
* Integrate Docker Bake into a CI/CD pipeline.
* Add explicit platform definitions to the `docker-bake.hcl` file.

## Contributing

Contributions focusing on Docker Bake improvements or enhancements are welcome. Feel free to submit a pull request or open an issue.
