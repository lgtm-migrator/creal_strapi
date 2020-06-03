#######################
# strapi production build.

# Should be the specific version of strapi/base:alpine.
FROM strapi/base:12-alpine@sha256:57941f35207e1ea92f739c40b75c9a8a35745f554e6e2dee8887b03534486d63 AS production

ENV NODE_ENV=production

WORKDIR /srv/app/

COPY ./ /srv/app/

RUN yarn install
RUN yarn build

CMD ["yarn", "start"]