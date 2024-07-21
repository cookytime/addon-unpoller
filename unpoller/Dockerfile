ARG BUILD_FROM=hassioaddons/base:latest
FROM ${BUILD_FROM}

RUN apk add --no-cache curl

# Install Unpoller
RUN curl -L https://github.com/unpoller/unpoller/releases/download/v2.11.2/unpoller_2.11.2_linux_amd64.tar.gz | tar xz -C /usr/local/bin

COPY run.sh /run.sh
RUN chmod +x /run.sh

EXPOSE 9130

CMD [ "/run.sh" ]
