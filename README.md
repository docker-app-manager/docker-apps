# Docker App Manager DockerApps

Keep in mind that the project is in a pre-aplha state so things can change, very fast.

A DockerApp is basically composed by two files
* DockerApp
* dockerapp.json 

## DockerApp file

It is a Dockerfile but with some variables that gets initialized at install time with the host-specific values

* $DAM_UID = UID of installing user
* $DAM_GID = GID of installing user
* $DAM_USERNAME = dockerapp

It is not mandatory but you should use the [dam image](https://github.com/docker-app-manager/docker-app-image) as base image for every DockerApp.

The dam image provides `dam-init.sh` for initializing the varius capabilities

```
RUN ./dam-init.sh $DAM_USERNAME $DAM_UID $DAM_GID "capabilities;separated;by;semicolon"
```

So the DockerApp file should look like this:

```
FROM dockerappmanager/dam:0.0.2

RUN ./dam-init.sh $DAM_USERNAME $DAM_UID $DAM_GID "x;pulse"

# Stuff

USER $DAM_USERNAME

# Run application
```

## dockerapp.json

JSON file that describes the DockerApp and it looks like this

```
{
    "name": "name-of-dockerapp",
    "version": "0.1",
    "app-volumes": [
        {
            "host": "local-directory",
            "container": "/path/to/container/directory"
        }
    ],
    "capabilities": ["x", "pulse"],
    "desktop-file": "dockerapp-desktop-file.desktop"
}
```

app-volumes gets mounted at runtime in $HOME/DockerApps/name-of-dockerapp/local-directory
