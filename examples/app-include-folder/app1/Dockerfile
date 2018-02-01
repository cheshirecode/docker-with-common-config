FROM node:8.6.0-alpine

# copy over folders, main and common
WORKDIR /usr/node/app1
RUN chown -R node:node .
USER node
COPY --chown=node:node ./app1 .
COPY --chown=node:node ./core ../core

# Output
RUN ls -asl .
RUN ls -asl ../

EXPOSE 3101

# Start the application
CMD node app.js