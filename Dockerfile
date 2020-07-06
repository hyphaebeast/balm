FROM rocker/r-ubuntu:20.04

RUN apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    build-essential \
    libatomic1 \
    libreadline-dev \
    ca-certificates \
    lzip \
    libffi-dev \
    libssl-dev \
    gfortran \
    autoconf \
    wget \
    unzip \
    m4 \
    cmake \
    gcc \
    gcc-arm-none-eabi \
    cppcheck \
    vera++ \
    libcurl4-openssl-dev \
    pkg-config \
    ubuntu-dev-tools \
    software-properties-common \
    apt-transport-https \
    curl \
    git \
    nano \
    bison \
    default-jre \
    libxml2-dev \
    gdebi-core \
    libudunits2-dev \
    cargo \
    libfontconfig1-dev

RUN install2.r --skipinstalled --ncpus 2 --error \
     --deps TRUE \
     tidyverse \
     shiny \
     rstan \
     brms \
     rstanarm \
     loo \
     bayesplot \
     shinystan \
     projpred \
     tidybayes \
     mgcv

# optional optimization for Stan
COPY config.R config.R
RUN Rscript config.R

# install RStudio server
# RUN wget https://download2.rstudio.org/server/bionic/amd64/rstudio-server-1.3.959-amd64.deb
# RUN gdebi rstudio-server-1.3.959-amd64.deb

# install Shiny Server
# RUN wget https://download3.rstudio.org/ubuntu-14.04/x86_64/shiny-server-1.5.14.948-amd64.deb
# RUN gdebi shiny-server-1.5.14.948-amd64.deb

# create user for RStudio
#RUN useradd -m -N balm
#RUN bash -c "echo balm:diego | chpasswd"
