# https://developers.home-assistant.io/docs/add-ons/configuration#add-on-dockerfile
ARG BUILD_FROM
FROM $BUILD_FROM

# Execute during the build of the image
RUN apt update
RUN apt install gpg
RUN \
    curl -s https://golift.io/repo.sh | bash -s - unpoller


