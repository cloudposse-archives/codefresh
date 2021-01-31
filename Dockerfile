ARG VERSION=0.141.3
ARG OS=debian

FROM cloudposse/geodesic:$VERSION-$OS

# Geodesic message of the day
ENV MOTD_URL="https://geodesic.sh/motd"

# Some configuration options for Geodesic
ENV AWS_SAML2AWS_ENABLED=false
ENV AWS_VAULT_ENABLED=false
ENV AWS_VAULT_SERVER_ENABLED=false
ENV GEODESIC_TF_PROMPT_ACTIVE=false
ENV DIRENV_ENABLED=false

ENV DOCKER_IMAGE="cloudposse/codefresh"
ENV DOCKER_TAG="latest"

# Geodesic banner message
ENV BANNER="Codefresh"

RUN apt-get update

# https://github.com/nodesource/distributions/blob/master/README.md#debinstall
RUN sudo curl -sL https://deb.nodesource.com/setup_15.x | bash -
RUN sudo apt-get install -y nodejs

# Install Codefresh CLI
# https://codefresh-io.github.io/cli/installation/npm/
RUN sudo npm install -g codefresh@latest

# https://github.com/codefresh-io/cli/blob/master/Dockerfile
RUN sudo codefresh components update --location components

COPY pipelines/ /pipelines/
COPY specs/ /specs/
COPY steps/ /steps/

WORKDIR /
