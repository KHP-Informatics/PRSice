# base image
FROM compbio/prsice:1.1

# Maintainer 
MAINTAINER Stephen Newhouse stephen.j.newhouse@gmail.com

# Set correct environment variables.
ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

# Remain current
RUN apt-get update --fix-missing && apt-get dist-upgrade -y --fix-missing

# prsice
ADD PRSice_v1.2.tar.gz /usr/local/pipeline/

RUN cd /usr/local/pipeline/PRSice_v1.2 && \
    chmod -R 777 /usr/local/pipeline/PRSice_v1.2* && \
    cp -v /usr/local/pipeline/PRSice_v1.2/* /usr/local/bin

# install fsmb
COPY fmsb_0.5.1.tar.gz /usr/local/pipeline/ 

RUN chmod -R 777 /usr/local/pipeline && \
	R CMD INSTALL /usr/local/pipeline/fmsb_0.5.1.tar.gz

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
