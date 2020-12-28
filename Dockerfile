#######################
# strapi production build.

# Should be the specific version of strapi/base:alpine.
FROM strapi/base:12-alpine@sha256:34329badeec2e75fa77976ef4358fefbb7276b93c2c45acd90f7a2a236dd1666 AS development

ENV NODE_ENV=production

WORKDIR /srv/app/

COPY ./ /srv/app/

RUN yarn install && yarn cache clean
RUN yarn build

CMD ["yarn", "start"]
