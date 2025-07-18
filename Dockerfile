FROM node:lts-alpine3.22
WORKDIR /appi
RUN npm init -y
RUN npm install express
COPY . .
EXPOSE 3000
CMD ["node", "index.js"]

