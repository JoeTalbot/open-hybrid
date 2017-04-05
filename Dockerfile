FROM node:wheezy

RUN apt-get update -y && apt-get install --no-install-recommends -y -q unzip
WORKDIR /app/openhybrid
ADD https://codeload.github.com/openhybrid/object/zip/v1.6.0 /app/openhybrid/v1.6.0.zip
RUN unzip -u /app/openhybrid/v1.6.0.zip -d /app/openhybrid
RUN cd /app/openhybrid/object-1.6.0 && npm install --no-optional

EXPOSE 8080
CMD ["npm", "start"]
  ENTRYPOINT ["/nodejs/bin/node", "/app/openhybrid/object-1.6.0/server.js"]
