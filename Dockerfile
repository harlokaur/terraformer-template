FROM ubuntu:20.04
MAINTAINER "hkaur@taos.com"

ENV TERRAFORM_VERSION=0.10.0
ENV PROVIDER=aws

# install vim git curl
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git vim curl unzip gnupg2 lsb-release software-properties-common

#install terraformer
RUN curl -LO https://github.com/GoogleCloudPlatform/terraformer/releases/download/$(curl -s https://api.github.com/repos/GoogleCloudPlatform/terraformer/releases/latest | grep tag_name | cut -d '"' -f 4)/terraformer-${PROVIDER}-linux-amd64 && \
    chmod +x terraformer-${PROVIDER}-linux-amd64 && \
    mv terraformer-${PROVIDER}-linux-amd64 /usr/local/bin/terraformer

#install aws
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install

RUN curl -fsSL https://apt.releases.hashicorp.com/gpg |  apt-key add - && \
     apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
    apt-get update && apt-get install terraform

#Check if terraformer is installed
RUN terraformer --version

#Check if aws is installed
RUN aws --version

#Check if terraform is installed
RUN terraform -help

CMD tail -f /dev/null