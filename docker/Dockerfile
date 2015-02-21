# base image
FROM debian:jessie

# Maintainer 
MAINTAINER Stephen Newhouse stephen.j.newhouse@gmail.com

# Set correct environment variables.
ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

# Remain current
RUN apt-get update --fix-missing && apt-get dist-upgrade -y

# Basic dependencies and tools
RUN apt-get update && \
 apt-get install -y --no-install-recommends \
 apt-utils \
 automake \
 ant \
 bash \
 binutils \
 perl \
 bioperl \
 build-essential \
 bzip2 \
 c++11 \
 cdbs \
 cmake \
 cron \
 curl \
 dkms \
 dpkg-dev \
 g++ \
 gpp \
 gcc \
 gfortran \
 git \
 git-core \
 libblas-dev \
 libatlas-dev \
 libbz2-dev \
 liblzma-dev \
 libpcre3-dev \
 libreadline-dev \
 make \
 mercurial \
 php5-curl \
 python python-dev python-yaml ncurses-dev zlib1g-dev python-numpy python-pip \
 sudo \
 subversion \
 tabix \
 tree \
 unzip \
 vim \
 wget \
 python-software-properties \
 libc-bin \
 llvm \
 libconfig-dev \
 ncurses-dev \
 zlib1g-dev \
 libX11-dev libXpm-dev libXft-dev libXext-dev \
 libatlas3-base \
 libblas3 \
 liblzma5 \
 libpango1.0-0 \
 libpaper-utils \
 libpcre3 \
 libpng12-0 \
 libquadmath0  \
 libreadline6 \
 libsm6 \
 libx11-6 \
 libxext6 \
 libxss1 \
 libxt6 \
 tcl8.5 \
 tk8.5 \
 ucf \
 xdg-utils \
 zip \
 ed \
 less \
 littler \
 locales \
 r-base-core \
 r-base-dev \
 r-recommended \
 r-cran-vgam \
 r-cran-rsqlite

#  upgrade
RUN apt-get update --fix-missing -y && apt-get upgrade -y

#-------------------------------Add user----------------------------------------------------------------------------------#
# Create a pipeline user:pipeman and group:ngsgroup

RUN useradd -m -s /bin/bash pipeman && \
  cd /home/pipeman && \
  echo "#bash config file for user pipeman" >> /home/pipeman/.bashrc

RUN groupadd ngsgroup && \
  usermod -aG ngsgroup pipeman && \
  usermod -aG sudo pipeman

#-----------------------------TOOLS DIRECTORY------------------------------------------------------------------------#  
#make pipeline install dirs
RUN mkdir /usr/local/pipeline && \
  chown pipeman:ngsgroup /usr/local/pipeline && \
  chmod 775 /usr/local/pipeline
  
#---------------------------------PRSice-------------------------------------#
  
RUN /usr/bin/Rscript --no-save --no-restore -e 'options(repos = list(CRAN = "http://cran.rstudio.com/")); install.packages("ggplot2",dependencies=TRUE)'  && \
    /usr/bin/Rscript --no-save --no-restore -e 'options(repos = list(CRAN = "http://cran.rstudio.com/")); install.packages("plyr",dependencies=TRUE)'  && \
    /usr/bin/Rscript --no-save --no-restore -e 'options(repos = list(CRAN = "http://cran.rstudio.com/")); install.packages("batch",dependencies=TRUE)'  && \
    /usr/bin/Rscript --no-save --no-restore -e 'options(repos = list(CRAN = "http://cran.rstudio.com/")); install.packages("fsmb",dependencies=TRUE)'  && \
    /usr/bin/Rscript --no-save --no-restore -e 'options(repos = list(CRAN = "http://cran.rstudio.com/")); install.packages("gtx",dependencies=TRUE)'
    
ADD PRSice_v1.2.tar.gz /usr/local/pipeline/

RUN cd /usr/local/pipeline/PRSice_v1.2 && \
    chmod -R 777 /usr/local/pipeline/PRSice_v1.2* && \
    cp -v /usr/local/pipeline/PRSice_v1.2/* /usr/local/bin

#-------------------------------PERMISSIONS--------------------------
RUN chmod -R 777 /usr/local/pipeline
RUN chown -R pipeman:ngsgroup /usr/local/pipeline

#---------------------------------------------------------------------
#Cleanup the temp dir
RUN rm -rf /tmp/*

#open ports private only
EXPOSE 8080

# Use baseimage-docker's bash.
CMD ["/bin/bash"]

#Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN apt-get autoclean && apt-get autoremove -y && rm -rf /var/lib/{apt,dpkg,cache,log}/
