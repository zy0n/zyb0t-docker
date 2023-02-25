FROM --platform="linux/amd64" debian:bookworm
WORKDIR /opt/zybot
COPY bin/zyb0t-linux install.sh ./
RUN chmod +x zyb0t-linux install.sh
WORKDIR /data
# RUN chmod +x install.sh