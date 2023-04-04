# Imod Container

Docker/Singularity image to run [imod](https://bio3d.colorado.edu/imod/) on Centos 6.9 kernel (Ubuntu 16.04)


If you have used this work for a publication, you must acknowledge SIH, e.g: "The authors acknowledge the technical assistance provided by the Sydney Informatics Hub, a Core Research Facility of the University of Sydney."


# Quickstart for Artemis

Put this repo on Artemis e.g.

```
cd /project/<YOUR_PROJECT>
git clone https://github.com/Sydney-Informatics-Hub/imod-contained.git
```
Then `cd imod-contained` and modify the `run_artemis.pbs` script and launch with `qsub run_artemis.pbs`.

Otherwise here are the full instructions for getting there....


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


## Build with singularity
```
export SINGLUARITY_CACHEDIR=`pwd`
export SINGLUARITY_TMPDIR=`pwd`

singularity build imod.img docker://nbutter/imod
```

## Run with singularity
To run the singularity image (noting singularity mounts the current folder by default)
```
singularity run --bind /project:/project imod.img /bin/bash -c "cd "$PBS_O_WORKDIR" imod sitecheck > sitecheck.txt"
```
