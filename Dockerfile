#######################
# strapi production build.

# Should be the specific version of strapi/base:alpine.
FROM strapi/base:12-alpine@sha256:8833472ea884107593539ebccc85d06e9097971dd4622fc84aec1854ac6a2456 AS development

ENV NODE_ENV=production

WORKDIR /srv/app/

COPY ./ /srv/app/

RUN yarn install && yarn cache clean
RUN yarn build

CMD ["yarn", "start"]
