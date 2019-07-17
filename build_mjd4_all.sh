#!/bin/bash -l
#
# script to build docker image for mjd
#
#  DJT  -   Univ. of South Carolina  -  2018
#
#-----------------------------------------------------
#
# start with docker clean slate
docker rmi -f $(docker images -a -q)
#
# base system + CLHEP + CERNroot
cd /Users/tedeschi/Documents/Majorana/docker/MajoranaSW4.2/centos_clhep_root
docker build -f Dockerfile.centos_clhep_root -t dave:centos_clhep_root .
#
# save new image locally
docker save dave:centos_clhep_root > /Users/tedeschi/Documents/Majorana/docker/Images/centos_clhep_root.tar
#
# add geant4 layer
cd /Users/tedeschi/Documents/Majorana/docker/MajoranaSW4.2/geant4
docker build -f Dockerfile.geant4 -t dave:centos_geant4 .
docker save dave:centos_geant4 > /Users/tedeschi/Documents/Majorana/docker/Images/centos_geant4.tar
#
# add mjsw
#
# can start with saved image:
# cd /Users/tedeschi/Documents/Majorana/docker/MajoranaSW4.2/
# docker load --input ../Images/centos_geant4.tar
#
cd /Users/tedeschi/Documents/Majorana/docker/MajoranaSW4.2/mjsw
docker build -f Dockerfile.mjsw -t dave:centos_mjsw .
docker save dave:centos_mjsw > /Users/tedeschi/Documents/Majorana/docker/Images/centos_mjsw.tar
#
# NERSC private registry
#
# need to have executed:
# docker login registry.services.nersc.gov
# user: d
# password : token from NERSC
#
docker tag $(docker images -q dave:centos_mjsw) registry.services.nersc.gov/dave/centos:latest
docker push registry.services.nersc.gov/dave/centos:latest
#
# then to load it at NERSC from the registry:
# log in to cori and execute:
# shifterimg --group majorana pull registry.services.nersc.gov/dave/centos:latest
#
# send tar file to NERSC for people to download to their own computers
#scp /Users/tedeschi/Documents/Majorana/docker/Images/centos_mjsw.tar dave@cori.nersc.gov:/global/homes/d/dave/docker/.
#
# dockerhub majorana private repo
#
# need to have executed:
# docker login
# user: m
# password :
#
docker tag $(docker images -q dave:centos_mjsw) majorana/centos:latest
docker push majorana/centos:latest
