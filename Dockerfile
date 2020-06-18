#######################
# strapi production build.

# Should be the specific version of strapi/base:alpine.
FROM strapi/base:12-alpine@sha256:120d361b62548ce737705e6bc6caf7299968775f7519af046c99d3d835308117 AS production

ENV NODE_ENV=production

WORKDIR /srv/app/

COPY ./ /srv/app/

RUN yarn install
RUN yarn build

CMD ["yarn", "start"]