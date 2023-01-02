FROM node:18.12 as build

WORKDIR /app

COPY package*.json .
RUN yarn
COPY . .

RUN yarn build

FROM nginx:1.19 as deploy

COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY --from=build /app/dist /usr/share/nginx/html
