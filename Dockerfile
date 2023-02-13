# FROM debian:stable-slim
FROM ubuntu:22.04

LABEL repository="https://github.com/corymurphy/ftp-deploy-action"
LABEL maintainer="Cory Murphy <public@corymurphy.io>"

RUN apt-get update
RUN apt-get install -y git
RUN apt-get install -y git-ftp
RUN apt-get install -y nodejs

COPY dist/index.js /deploy.js
RUN chmod +x deploy.js

ENTRYPOINT ["node", "../../deploy.js"]
