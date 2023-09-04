FROM --platform=linux/amd64 ubuntu

RUN apt update && apt upgrade && apt-get install -y sudo && sudo apt-get install -y net-tools vim
