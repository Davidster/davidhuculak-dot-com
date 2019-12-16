FROM node:lts-alpine
RUN npm install -g reload
WORKDIR /workdir