FROM node:10.15-slim as builder
RUN npm install -g @angular/cli && mkdir /app
WORKDIR /app
COPY . /app
RUN npm install
RUN ng build --prod

FROM nginx:1.15
RUN rm -rf /usr/share/nginx/html/*
COPY nginx.conf /etc/nginx/
COPY --from=builder /app/dist/APP-NAME /usr/share/nginx/html
