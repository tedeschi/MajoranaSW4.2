#!/bin/bash -l
#
# script to get latest version of mjd software from git repo
# for OrcaRoot see http://orca.physics.unc.edu/~markhowe/Getting_Started/Installation.html
# mjrdb_utils is from production directory (also found in mjd/git somewhere)
#
#  DJT  -   Univ. of South Carolina  -  2018
#
#-----------------------------------------------------
#
cd /Users/tedeschi/Documents/Majorana/docker/MajoranaSW4.2/mjsw
#
#
#rm -rf OrcaRoot
#svn co svn://orca.physics.unc.edu/OrcaRoot
#
#rm -rf MJOR
#git clone https://github.com/mppmu/MJOR.git
#
#rm -rf mjd_siggen
#svn co https://radware.phy.ornl.gov/MJ/mjd_siggen/
#
rm -rf MGDO; git clone https://github.com/mppmu/MGDO.git
#
rm -rf GAT; git clone https://github.com/mppmu/GAT.git
#
#rm -rf MaGe
#git clone https://github.com/mppmu/MaGe.git
# get the latest json file for MAGEDIR
#scp dave@cori.nersc.gov:/global/project/projectdirs/majorana/software/sl64/mjsw/mjsw201807Prod/MaGe/MJD.json .
#
