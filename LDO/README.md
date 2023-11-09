# LDO

[Proposal link](https://github.com/sscs-ose/sscs-ose-chipathon.github.io/blob/main/initial_notebooks_2023/accepted_notebooks/labbench-on-chip-pmic/labbench-on-chip-pmic.ipynb)

The scope of the LDO changed:

- The DCDC is not going to be implemented.

## How to run

The project includes two ways of enabling a development environment in which test
the design:


### Using a Docker Container

A custom container was developed to resolve all dependencies that xschem, klayout and the PDK have.
The script `run.ps1` executes the container on Windows.


### Using DevContainers

Devcontainer is an extension of Visual Studio Code that allow it to link into
the container.

This solution currently supports Windows environments.
