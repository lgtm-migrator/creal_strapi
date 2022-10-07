FROM node:16.17.1-alpine@sha256:7584b116f368d94fab2ecc21ebbcfd5434a3427c2f96f846972821b5ad0266fc AS development
# Installing libvips-dev for sharp Compatability
RUN apk update && apk add build-base gcc autoconf automake zlib-dev libpng-dev nasm bash vips-dev \
  && rm -rf /var/cache/apk/* > /dev/null 2>&1
ARG NODE_ENV=development
ENV NODE_ENV=${NODE_ENV}
WORKDIR /opt/
COPY ./package.json ./yarn.lock ./
ENV PATH /opt/node_modules/.bin:$PATH
RUN yarn config set network-timeout 600000 -g && yarn install
WORKDIR /opt/app
COPY ./ .
RUN yarn build
EXPOSE 1337
CMD yarn && yarn develop

FROM node:16.17.1-alpine@sha256:7584b116f368d94fab2ecc21ebbcfd5434a3427c2f96f846972821b5ad0266fc
RUN apk add vips-dev \
  && rm -rf /var/cache/apk/*
ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}
WORKDIR /app
COPY --from=development /opt/node_modules ./node_modules
ENV PATH /opt/node_modules/.bin:$PATH
COPY --from=development /opt/app ./
EXPOSE 1337
CMD ["yarn", "start"]
