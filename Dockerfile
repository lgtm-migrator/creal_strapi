#######################
# strapi production build.

# Should be the specific version of strapi/base:alpine.
FROM strapi/base:12-alpine@sha256:b6dd3f511e212724db902ab87bc242af902ba2a9a0c83f4342dd06a5c4d8b4d9 AS production

ENV NODE_ENV=production

WORKDIR /srv/app/

COPY ./ /srv/app/

RUN yarn install
RUN yarn build

CMD ["yarn", "start"]