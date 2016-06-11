
# Building the plugin(s) and deploying Kong
An environment for iterating quickly when developing Kong plugins.

Uses Docker to bring up a Casandra, Kong and sets up Nodemon to watch for changes to kong.yml and any plugins. If changes are detected ```luarocks make``` installs the plugin(s) and Kong is reloaded.

## Start up
Startup Docker on OSX:
```
docker-machine start default
eval $(docker-machine env)
```

Bring up the casandra and the kong container
```
docker-compose up

```

Kong is not started right away (as during development an invalid plugin can bring it down and it's handy to see the logs + restart). 
To bring up Kong you need to connect to the container and execute the command manually:

```
docker exec -i -t $(docker ps --filter ancestor=superpixel/kong-plugin-development -q) kong start
```
