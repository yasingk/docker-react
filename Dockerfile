FROM node:alpine as builder 

WORKDIR '/usr/app'
COPY package*.json .
RUN npm install --quiet
COPY . .
RUN npm run build

#/usr/app/build"

FROM nginx
COPY --from=builder /usr/app/build /usr/share/nginx/html