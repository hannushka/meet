# Welcome to Meet!

Social media alternative. Work in progress.

**meet/** contains the VueJS frontend \
**meet-api/** contains the Phoenix API 

# Commands

docker-compose up -d

**Connect to database through shell:**

docker exec -ti meet_neo4j_1 sh
cypher-shell

**Connect to database through browser:**

Go to localhost:7474 in browser.

On Windows:

Run docker-machine ip to get docker ip.

Go to http://<docker-machine ip>:<exposed port> in browser.
Use bolt://192.168.99.100:7687 to connect to Bolt protocol.
