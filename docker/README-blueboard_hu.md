# Blueboard – Docker beállítás

[English readme](./README-blueboard_en.md)

Szolgáltatások:

- **builder** – lefordítja az alkalmazást, majd kilép  
- **migrator** – lefuttatja az Entity Framework Core migrációkat az adatbázison  
- **blueboard** – a backend futtatása production módban  
- **db** – PostgreSQL adatbázis perzisztens adattal

---

## Előfeltételek

- [Docker](https://docs.docker.com/get-docker/)  
- [Docker Compose](https://docs.docker.com/compose/install/)  

---

## Környezeti változók

Minden fontos (nem publikus) értéket egy [`.env`](../Blueboard/.env.example) fájlba írj a [Blueboard](../Blueboard) mappában.

> ⚠️ A `.env` fájlt **soha ne commitold**.

---

## Használat

### 1. Adatbázis indítása

```bash
docker compose up -d db
````

### 2. Alkalmazás buildelése

```bash
docker compose run --rm builder
```

### 3. Migrációk futtatása

```bash
docker compose run --rm migrator
```

### 4. Alkalmazás futtatása

```bash
docker compose up -d blueboard
```
