FROM node:14.17.0
WORKDIR /home/node/app
COPY serverSide /home/node/app
RUN npm install
CMD npm start
EXPOSE 3000