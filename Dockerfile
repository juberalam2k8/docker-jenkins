From ubuntu:latest
WORKDIR /uppy
RUN apt update
RUN apt install git -y
CMD tail -f /dev/null