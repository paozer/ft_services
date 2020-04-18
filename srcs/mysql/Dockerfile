FROM alpine:latest

RUN apk add mysql mysql-client --no-cache

COPY /srcs/my.cnf /etc/mysql/
COPY /srcs/startup.sh /
COPY /srcs/setup.sh /

EXPOSE 3306

ENTRYPOINT ["/startup.sh"]
