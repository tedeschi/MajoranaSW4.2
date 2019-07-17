#!/bin/bash -l
#
# script to build docker image for mjd
# only rebuild mjsw layer
#
# execute as:
# ./build_mjd4_mjsw.sh >& build_mjsw.log &
#
#  DJT  -   Univ. of South Carolina  -  2018
#
#-----------------------------------------------------------------------------------------------------
#
# start with docker clean slate
echo "docker rmi -f $(docker images -a -q)"
docker rmi -f $(docker images -a -q)
#
# start with saved image:
echo "docker load --input /Users/tedeschi/Documents/Majorana/docker/Images/centos_geant4.tar"
docker load --input /Users/tedeschi/Documents/Majorana/docker/Images/centos_geant4.tar
#
cd /Users/tedeschi/Documents/Majorana/docker/MajoranaSW4.2/mjsw
echo "docker build -f Dockerfile.mjsw -t dave:centos_mjsw ."
docker build -f Dockerfile.mjsw -t dave:centos_mjsw .
#
#echo "docker save dave:centos_mjsw > /Users/tedeschi/Documents/Majorana/docker/Images/centos_mjsw.tar"
#docker save dave:centos_mjsw > /Users/tedeschi/Documents/Majorana/docker/Images/centos_mjsw.tar
# -----------------------------------------------------------------------------------------------------
# NERSC private registry
#
# need to have executed:
# docker login registry.services.nersc.gov
# user: d
# password : token from NERSC
#
#echo "docker tag $(docker images -q dave:centos_mjsw) registry.services.nersc.gov/dave/centos:latest"
#docker tag $(docker images -q dave:centos_mjsw) registry.services.nersc.gov/dave/centos:latest
#
#echo "docker push registry.services.nersc.gov/dave/centos:latest"
#docker push registry.services.nersc.gov/dave/centos:latest
#
# then to load it at NERSC from the registry:
# log in to cori and execute:
# shifterimg pull registry.services.nersc.gov/dave/centos:latest
#
# -----------------------------------------------------------------------------------------------------
# dockerhub majorana private repo
#
# need to have executed:
# docker login
# user: m
# password :
#
#echo "docker tag $(docker images -q dave:centos_mjsw) majorana/centos:latest"
#docker tag $(docker images -q dave:centos_mjsw) majorana/centos:latest
#
#echo "docker push majorana/centos:latest"
#docker push majorana/centos:latest
#
