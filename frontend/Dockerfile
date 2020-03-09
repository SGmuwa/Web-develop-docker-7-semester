FROM alpine as builder
RUN apk add git npm
ARG BRANCH=master
ARG REPOSITORY_USER=SGmuwa
ARG REPOSITORY_NAME=Web-develop-frontend-7-semester
ADD https://api.github.com/repos/${REPOSITORY_USER}/${REPOSITORY_NAME}/git/refs/heads/${BRANCH} version.json
RUN git clone -b${BRANCH} https://github.com/${REPOSITORY_USER}/${REPOSITORY_NAME}.git /gitrepository
WORKDIR /gitrepository
RUN npm install
RUN npm run-script build
WORKDIR /
FROM nginx
COPY --from=builder /gitrepository/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf.template
CMD /bin/bash -c "envsubst '\$PORT' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf" && nginx -g 'daemon off;'
