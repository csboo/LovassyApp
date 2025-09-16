# Boardlight – Docker beállítás

[English readme](./README-boardlight.en.md)

Szolgáltatás:

- **boardlight** – futtatja a frontend-et automatikus újratöltéssel (hot reload)

---

## Előfeltételek

- [Docker](https://docs.docker.com/get-docker/)  
- [Docker Compose](https://docs.docker.com/compose/install/)  

---

## Használat

### 1. Az alkalmazás futtatása

```bash
docker compose up
```

Ez felépíti az image-et, felcsatolja a forráskódot, és elindítja a Boardlight-ot a [http://localhost](http://localhost) címen.
A kódban végzett módosítások automatikusan meg fognak jelenni.
