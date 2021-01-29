FROM ubuntu:20.04
MAINTAINER "hkaur@taos.com"

ENV TERRAFORM_VERSION=0.10.0
ENV PROVIDER=aws

# install vim git curl
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git vim curl

#install terraformer
RUN curl -LO https://github.com/GoogleCloudPlatform/terraformer/releases/download/$(curl -s https://api.github.com/repos/GoogleCloudPlatform/terraformer/releases/latest | grep tag_name | cut -d '"' -f 4)/terraformer-${PROVIDER}-linux-amd64 && \
    chmod +x terraformer-${PROVIDER}-linux-amd64 && \
    mv terraformer-${PROVIDER}-linux-amd64 /usr/local/bin/terraformer

#Check if terraformer is installed
RUN terraformer --version

#ADD config /root/.aws/config
ADD credentials /root/.aws/credentials

CMD tail -f /dev/null