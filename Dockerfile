# -*- Mode:Python; indent-tabs-mode:nil; tab-width:4 -*-
#
# Copyright 2017 Nils Tekampe <nils@tekampe.org>
#
# This file is part of duplicity.
#
# Duplicity is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by the
# Free Software Foundation; either version 2 of the License, or (at your
# option) any later version.
#
# Duplicity is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with duplicity; if not, write to the Free Software Foundation,
# Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA

FROM ubuntu:16.04

#Setting a working directory for everything else
WORKDIR /duplicty 

# Installing some pre-requisites
RUN apt-get update && apt-get install -y sudo && rm -rf /var/lib/apt/lists/*
RUN sudo apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends apt-utils

RUN apt-get install -y software-properties-common python-software-properties

# The following packages are needed for testing duplicity
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install python2.7
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install python-dev 
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install librsync-dev 
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install lftp
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install par2
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install bzr
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install python-setuptools
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install python-pip
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install openssl
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install libssl-dev
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install intltool

RUN pip install --upgrade pip

# Branch the dupllicity repo for testing 
RUN bzr branch lp:~dernils/duplicity/testing

# Installing requirements for pip 
RUN pip install -r ./testing/requirements.txt

