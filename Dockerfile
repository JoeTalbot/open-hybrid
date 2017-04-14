FROM node:wheezy

RUN apt-get update -y && apt-get install --no-install-recommends -y -q unzip
WORKDIR /app/openhybrid
ADD https://codeload.github.com/openhybrid/object/zip/v1.6.0 /app/openhybrid/v1.6.0.zip
RUN unzip -u /app/openhybrid/v1.6.0.zip -d /app/openhybrid
RUN cd /app/openhybrid/object-1.6.0 && npm install --no-optional
ADD https://github.com/JoeTalbot/objects/archive/master.zip /app/openhybrid/objects.zip
RUN unzip -u /app/openhybrid/objects.zip -d /app/openhybrid/
RUN rm -rf /app/openhybrid/object-1.6.0/objects
RUN mv /app/openhybrid/objects-master /app/openhybrid/object-1.6.0/objects

EXPOSE 8080
CMD ["npm", "start"]
ENTRYPOINT ["/usr/local/bin/node", "/app/openhybrid/object-1.6.0/server.js", "> server.log"]
