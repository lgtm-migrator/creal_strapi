#######################
# strapi production build.

# Should be the specific version of strapi/base:alpine.
FROM strapi/base:12-alpine@sha256:e5c1198196ff6458b74f1c4919c1469dae0edc7c59f95b1b8d2dfa264b488e42 AS development

ENV NODE_ENV=production

WORKDIR /srv/app/

COPY ./ /srv/app/

RUN yarn install && yarn cache clean
RUN yarn build

CMD ["yarn", "start"]
