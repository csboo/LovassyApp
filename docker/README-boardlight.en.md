# Boardlight – Docker Setup

[Magyar readme](./README-blueboard.hu.md)

Service:

- **boardlight** – runs the frontend with hot reload

---

## Prerequisites

- [Docker](https://docs.docker.com/get-docker/)  
- [Docker Compose](https://docs.docker.com/compose/install/)  

---

## Usage

### 1. Run the app

```bash
docker compose up
````

This will build the image, mount the source code, and start Boardlight on [http://localhost](http://localhost).
Changes to your code should reflect automatically.
