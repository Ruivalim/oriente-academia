FROM node:16 as builder

WORKDIR /app

COPY package.json ./
COPY pnpm-lock.yaml ./

RUN curl -f https://get.pnpm.io/v6.16.js | node - add --global pnpm

RUN pnpm install --frozen-lockfile

COPY . .

RUN pnpm run build

FROM node:16-alpine as runner

WORKDIR /app

COPY --from=builder /app ./

RUN yarn install --production

EXPOSE 3002

ENV NODE_ENV=production
ENV PORT=3002

CMD [ "node", "build" ]