#######################
# strapi production build.

# Should be the specific version of strapi/base.
# v14 is not kept up to date as of 2021-06-05.
# alpine usage leads to an error on start.
FROM strapi/base:12@sha256:8c0bf08475eb479296768dc4ecf03d20afa7d275501ea5a12a5bf0590048d480 AS development

ENV NODE_ENV=production

WORKDIR /srv/app/

COPY ./ /srv/app/

RUN yarn install && yarn cache clean
RUN yarn build

CMD ["yarn", "start"]
