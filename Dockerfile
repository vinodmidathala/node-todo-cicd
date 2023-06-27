FROM node:12.2.0-alpine
WORKDIR app
COPY . .
RUN npm install
EXPOSE 8100
CMD ["node", "app.js"]
