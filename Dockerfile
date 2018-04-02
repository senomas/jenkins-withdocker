FROM jenkins/jenkins:lts
LABEL maintainer="Senomas <agus@senomas.com>"

USER root

RUN apt-get update && \
  apt-get -y install apt-transport-https \
  ca-certificates \
  curl \
  gnupg2 \
  build-essential \
  software-properties-common && \
  curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
  curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
  add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
  $(lsb_release -cs) \
  stable" && \
  apt-get update && \
  apt-get -y install nodejs docker-ce

RUN npm i yarn gulp-cli -g
