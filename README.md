# Imod Container

Docker image to run [imod](https://bio3d.colorado.edu/imod/)


If you have used this work for a publication, you must acknowledge SIH, e.g: "The authors acknowledge the technical assistance provided by the Sydney Informatics Hub, a Core Research Facility of the University of Sydney."


# How to recreate

## Build with docker
Check out this repo then build the Docker file.
```
sudo docker build . -t nbutter/imod
```

## Run with docker.
To run this, mounting your current host directory in the container directory, at /project, and interactively launch imod run these steps:
```
xhost +
sudo docker run --gpus all -it --rm -v `pwd`:/project -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY nbutter/imod
imod
```

## Push to docker hub
```
sudo docker push nbutter/imod
```

See the repo at [https://hub.docker.com/r/nbutter/imod](https://hub.docker.com/r/nbutter/imod)



