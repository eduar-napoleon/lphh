# # syntax=docker/dockerfile:1
# # MAINTAINER "Brian Scott <dev@bscott.mozmail.com>"

# FROM alpine:3.6

# ARG POCKETBASE_VERSION=0.7.9

# # Install the dependencies
# RUN apk add --no-cache \
#     ca-certificates \
#     unzip \
#     wget \
#     zip \
#     zlib-dev

# # Download Pocketbase and install it for AMD64
# ADD https://github.com/pocketbase/pocketbase/releases/download/v${POCKETBASE_VERSION}/pocketbase_${POCKETBASE_VERSION}_linux_amd64.zip /tmp/pocketbase.zip
# RUN unzip /tmp/pocketbase.zip -d /usr/local/bin/
# RUN chmod +x /usr/local/bin/pocketbase
# WORKDIR /usr/local/bin

# COPY /build /usr/local/bin/pb_public
# # Notify Docker that the container wants to expose a port.
# EXPOSE 8090

# # Start Pocketbase
# CMD [ "/usr/local/bin/pocketbase", "serve","--http=0.0.0.0:8090" ]
FROM pagespeed/nginx-pagespeed
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY . /usr/share/nginx/html