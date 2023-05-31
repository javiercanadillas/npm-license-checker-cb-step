FROM node:19-buster-slim
RUN npm install -g license-checker
ENTRYPOINT license-checker