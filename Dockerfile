#######################
# strapi production build.

# Should be the specific version of strapi/base:alpine.
FROM strapi/base:12-alpine@sha256:6f16e05812a6d8000987edffe381d59e1ec3590438ffa865dcbac27f7c9491cb AS production

ENV NODE_ENV=production

WORKDIR /srv/app/

COPY ./ /srv/app/

RUN yarn install
RUN yarn build

CMD ["yarn", "start"]