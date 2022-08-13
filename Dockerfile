FROM node:14.20.0-alpine3.16 as build

VOLUME "/src"
WORKDIR "/src"

COPY . .
CMD ["yarn","install;", "&&","yarn","gulp","build"]