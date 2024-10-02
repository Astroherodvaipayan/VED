FROM node:slim

ARG SEARXNG_API_URL
ENV SEARXNG_API_URL=${SEARXNG_API_URL}

WORKDIR /home/ved

COPY src /home/ved/src
COPY tsconfig.json /home/ved/
COPY config.toml /home/ved/
COPY drizzle.config.ts /home/ved/
COPY package.json /home/ved/
COPY yarn.lock /home/ved/

RUN mkdir /home/ved/data

RUN yarn install 
RUN yarn build

CMD ["yarn", "start"]