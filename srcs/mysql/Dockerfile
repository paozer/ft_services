FROM alpine:latest

RUN apk add mysql mysql-client --no-cache

COPY /srcs/wp.sql /
COPY /srcs/entrypoint.sh /
COPY /srcs/setup.sh /

EXPOSE 3306

ENTRYPOINT ["/entrypoint.sh"]
