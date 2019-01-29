FROM node:9
COPY . /src
WORKDIR /src
RUN yarn && yarn build --prod