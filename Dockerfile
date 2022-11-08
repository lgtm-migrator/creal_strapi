FROM node:18.12.1-alpine@sha256:b78c9500958805b52214e8bd588defe55ec32116dfdc094e3ca652a3502d67df AS development
# Installing libvips-dev for sharp Compatability
RUN apk update && apk add build-base gcc autoconf automake zlib-dev libpng-dev nasm bash vips-dev \
  && rm -rf /var/cache/apk/* > /dev/null 2>&1
ARG NODE_ENV=development
ENV NODE_ENV=${NODE_ENV}
WORKDIR /srv/
COPY ./package.json ./yarn.lock ./
ENV PATH /srv/node_modules/.bin:$PATH
RUN yarn config set network-timeout 600000 -g && yarn install
WORKDIR /srv/app
COPY ./ .
RUN yarn build
EXPOSE 1337
CMD yarn && yarn develop

FROM node:18.12.1-alpine@sha256:b78c9500958805b52214e8bd588defe55ec32116dfdc094e3ca652a3502d67df
RUN apk add vips-dev \
  && rm -rf /var/cache/apk/*
ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}
WORKDIR /app
COPY --from=development /srv/node_modules ./node_modules
ENV PATH /srv/node_modules/.bin:$PATH
COPY --from=development /srv/app ./
EXPOSE 1337
CMD ["yarn", "start"]
