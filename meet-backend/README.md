# MeetApi

To start your Phoenix server:

- Install dependencies with `mix deps.get`
- Run `docker-compose up`
- Start Phoenix endpoint with `mix phx.server`

## Problem with comeonin compile on Windows

https://github.com/riverrun/comeonin/issues/75

## Connect to database through shell:

```
docker exec -ti meet_neo4j_1 sh
cypher-shell
```

## Connect to database through browser:

Go to localhost:7474 in browser.

### On Windows:

Run docker-machine ip to get docker ip.

Go to http://docker-machine ip:exposed port in browser.
Use bolt://192.168.99.100:7687 to connect to Bolt protocol.
