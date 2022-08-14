FROM node:14.20.0-alpine3.16 as build

RUN apk add git --no-cache
WORKDIR "/src"

COPY . /src
RUN yarn install && \
	yarn cache clean
RUN	yarn gulp build

FROM scratch AS export
COPY --from=build /src/index.html .
COPY --from=build /src/build ./build



FROM nginx:latest
COPY . /usr/share/nginx/html/
COPY --from=export . /usr/share/nginx/html/
