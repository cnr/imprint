FROM docker.io/zmkfirmware/zmk-dev-arm:3.5
RUN mkdir -p /tmp/zmk-workspace/init
WORKDIR /tmp/zmk-workspace
COPY config/west.yml /tmp/zmk-workspace/init/west.yml
RUN west init -l init && west update && west zephyr-export

WORKDIR /imprint
