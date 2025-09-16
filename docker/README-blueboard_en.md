# Blueboard – Docker Setup

[Magyar readme](./README-blueboard_hu.md)

services:

- **blueboard** – runs the backend, see '--help' for details
- **db** – PostgreSQL database with persisted data

---

## Prerequisites

- [Docker](https://docs.docker.com/get-docker/)  
- [Docker Compose](https://docs.docker.com/compose/install/)  

---

## Environment Variables

All sensitive values should be provided via a [`.env`](../Blueboard/.env.example) file in the [Blueboard](../Blueboard) folder

> ⚠️ **Do not commit** `.env` to version control.

---

## Usage

### Start Blueboard

```bash
docker compose run --rm blueboard migrate
docker compose up (-d)
```

### Run commands to manage Blueboard

```bash
docker compose run --rm blueboard [COMMAND]
```
