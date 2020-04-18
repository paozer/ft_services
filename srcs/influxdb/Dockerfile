FROM alpine:latest

RUN apk add influxdb --no-cache

#COPY srcs/setup.sh /
#RUN chmod +x /setup.sh

EXPOSE 8086

ENTRYPOINT ["influxd"]
