# Kong Plugin Development
An environment for iterating quickly when developing Kong plugins. Lua, Kong + livereload.

Uses Docker to bring up a Casandra, Kong and sets up Nodemon to watch for changes to kong.yml and any plugins. If changes are detected ```luarocks make``` installs the plugin(s) and Kong is reloaded.

## Start up
Startup Docker on OSX:
```
docker-machine start default
eval $(docker-machine env)
```

Bring up the Casandra and Kong containers
```
docker-compose up
```

Kong is not started right away (as during development an invalid plugin can bring it down and it's handy to see the logs + restart). 
To bring up Kong you need to connect to the container and execute the command manually:

```
docker exec -i -t $(docker ps --filter ancestor=superpixel/kong-plugin-development -q) kong start
```
If this is the first run it will take a minute to bootstrap.

Once finished whenever the files in ```./plugins``` or ```./config``` are changed Kong will be reloaded and the updated plugins loaded in.