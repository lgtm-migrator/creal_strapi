#######################
# strapi production build.

# Should be the specific version of strapi/base-alpine.
FROM strapi/base:14-alpine@sha256:b5a31897ac198a084612433d1c6fe70530cc7c2a12f18209ecd27400dbf5decb AS development

WORKDIR /srv/app/

CMD yarn && yarn develop

# Should be the specific version of strapi/base-alpine.
FROM strapi/base:14-alpine@sha256:b5a31897ac198a084612433d1c6fe70530cc7c2a12f18209ecd27400dbf5decb AS production

ENV NODE_ENV=production

WORKDIR /srv/app/

COPY ./ /srv/app/

RUN yarn install \
  && yarn cache clean \
  && yarn build

CMD ["yarn", "start"]
