# 1) choose base container
# generally use the most recent tag

# base notebook, contains Jupyter and relevant tools
# See https://github.com/ucsd-ets/datahub-docker-stack/wiki/Stable-Tag 
# for a list of the most current containers we maintain
ARG BASE_CONTAINER=ghcr.io/ucsd-ets/scipy-ml-notebook:stable

FROM $BASE_CONTAINER

LABEL maintainer="UC San Diego ITS/ETS <ets-consult@ucsd.edu>"

# 2) change to root to install packages
USER root

#xarray, netCDF, and dask 
#RUN apt-get -y install htop
# RUN pip install xarray netCDF4 dask

# 3) install packages using notebook user
USER jovyan

RUN mamba install -y xarray netCDF4 dask cartopy

RUN pip install --no-cache-dir dask-ml scikeras

# Override command to disable running jupyter notebook at launch
# CMD ["/bin/bash"]
