FROM ubuntu:16.10


RUN apt-get update -y && apt-get install -y curl bash lib32gcc1

RUN useradd -ms /bin/bash steam

WORKDIR /home/steam

RUN curl -O -L https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz
RUN tar -zxf steamcmd_linux.tar.gz
USER steam
RUN ./steamcmd.sh +login anonymous +app_update 258550 +quit
CMD ./steamcmd.sh +login anonymous +app_update 258550 +quit && ./Steam/steamapps/common/rust_dedicated/RustDedicated -batchmode -nographics \
  -server.ip "$RUST_SERVER_IP" \
  -server.port 28015 \
  -rcon.ip "$RUST_SERVER_IP" \
  -rcon.port 28016 \
  -rcon.password "$RUST_PASSWORD" \
  -server.maxplayers 200 \
  -server.hostname "$RUST_HOSTNAME" \
  -server.identity "$RUST_IDENTITY" \
  -server.level "Procedural Map" \
  -server.seed $RUST_WORLD_SEED \
  -server.worldsize $RUST_WORLD_SIZE \
  -server.saveinterval 300 \-server.globalchat true \
  -server.description "$RUST_DESCRIPTION" \
  -server.headerimage "$RUST_HEADER_IMAGE" \
  -server.url "$RUST_URL"
