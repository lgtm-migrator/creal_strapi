#######################
# strapi production build.

# Should be the specific version of strapi/base:alpine.
FROM strapi/base:12-alpine@sha256:0343ca23bbc02e102b2af7e21fca8374cdc594a1f2b1ebb46add7395108e14be AS production

ENV NODE_ENV=production

WORKDIR /srv/app/

COPY ./ /srv/app/

RUN yarn install
RUN yarn build

CMD ["yarn", "start"]