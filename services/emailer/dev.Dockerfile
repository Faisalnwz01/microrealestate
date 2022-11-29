FROM node:16-alpine

RUN apk --no-cache add build-base python3

WORKDIR /usr/app

COPY services/common services/common
COPY services/emailer services/emailer
COPY package.json .
COPY yarn.lock .

RUN yarn config set network-timeout 600000 -g && \
    yarn workspace @microrealestate/emailer install --frozen-lockfile

RUN chown -R node:node /usr/app

USER node

CMD ["yarn", "workspace", "@microrealestate/emailer", "run", "dev"]