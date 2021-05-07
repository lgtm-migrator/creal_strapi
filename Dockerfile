#######################
# strapi production build.

# Should be the specific version of strapi/base:alpine.
FROM strapi/base:14-alpine@sha256:16cabf20a9a26ddd8cc84ea41b9c8019b17cee21a03596ef1e44cf0f1d83ac83 AS development

ENV NODE_ENV=production

WORKDIR /srv/app/

COPY ./ /srv/app/

RUN yarn install && yarn cache clean
RUN yarn build

CMD ["yarn", "start"]
