#Build phase
FROM node:alpine3.10

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

#Run phase
FROM nginx:1.19

EXPOSE 80

COPY --from=0 /app/build /usr/share/nginx/html