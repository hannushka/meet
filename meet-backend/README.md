# Meet Api

To start your Phoenix server:

- Install dependencies with `mix deps.get`
- Run `docker-compose up`
- Start Phoenix endpoint with `mix phx.server`

## Swagger

Access swagger at `http://localhost:4000/api/swagger/`.

## Problem with comeonin compile on Windows

https://github.com/riverrun/comeonin/issues/75

## Connect to database through shell:

```
docker exec -ti meet_neo4j_1 sh
cypher-shell
```

## Connect to database through browser:

Go to localhost:7474 in browser.
