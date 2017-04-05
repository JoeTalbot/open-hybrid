FROM readytalk/nodejs

  WORKDIR /app/openhybrid
  ADD https://codeload.github.com/openhybrid/object/zip/v1.6.0 /app/openhybrid/v1.6.0.zip
  RUN apt-get install unzip && \
      unzip -u /app/openhybrid/v1.6.0.zip -d /app/openhybrid
  RUN cd /app/openhybrid/object-1.6.0 && npm install

  CMD ["npm", "start"]
  ENTRYPOINT ["/nodejs/bin/node", "/app/openhybrid/object-1.6.0/server.js"]
