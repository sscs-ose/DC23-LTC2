# LDO

[Proposal link](https://github.com/sscs-ose/sscs-ose-chipathon.github.io/blob/main/initial_notebooks_2023/accepted_notebooks/labbench-on-chip-pmic/labbench-on-chip-pmic.ipynb)

The scope of the LDO changed:

- The DCDC is not going to be implemented.

## How to use Development Environment

The development environment is based on docker and can be used in two ways:

### 1. Using a Docker Container

A custom container was developed to resolve all dependencies that xschem, klayout and the PDK have.
The script `run.ps1` executes the container on Windows.

To run it on linux, execute the following:

~~~bash
$ docker run -it -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --name ldo-environ git.1159.cl/mario1159/chipathon-tools
~~~


### 2. Using DevContainers

Devcontainer is an extension of Visual Studio Code that links the editor with the container. I's useful when developing
code in pythona or jupyter notebooks.

This solution currently supports Windows environments. On linux the line that invokes a powershell script should be removed.
