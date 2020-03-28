FROM alpine:latest

# --no-cache is equivalent to apk update && later rm cache
RUN apk add --no-cache nginx
# RUN apk add --no-cache vim
# nginx executable @ usr/sbin/

CMD ["nginx", "-g", "daemon off;"]
