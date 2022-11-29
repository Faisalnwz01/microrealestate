FROM node:16-alpine

RUN apk --no-cache add build-base python3 mongodb-tools

WORKDIR /usr/app

COPY services/common services/common
COPY services/api services/api
COPY package.json .
COPY yarn.lock .

RUN yarn config set network-timeout 600000 -g && \
    yarn workspace @microrealestate/api install --frozen-lockfile

RUN chown -R node:node /usr/app

USER node

CMD ["yarn", "workspace", "@microrealestate/api", "run", "dev"]