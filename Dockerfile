FROM ubuntu:16.10


RUN apt-get update -y && apt-get install -y curl bash lib32gcc1

RUN useradd -ms /bin/bash steam

WORKDIR /home/steam

RUN curl -O -L https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz
RUN tar -zxf steamcmd_linux.tar.gz
USER steam
RUN ./steamcmd.sh +login anonymous +app_update 258550 +quit
CMD ./Steam/steamapps/common/rust_dedicated/RustDedicated -batchmode -nographics \
  -server.ip IPAddressHere \
  -server.port 28015 \
  -rcon.ip IPAddressHere \
  -rcon.port 28016 \
  -rcon.password "rcon password here" \
  -server.maxplayers 75 \
  -server.hostname "Server Name" \
  -server.identity "my_server_identity" \
  -server.level "Procedural Map" \
  -server.seed 12345 \
  -server.worldsize 3000 \
  -server.saveinterval 300 \-server.globalchat true \
  -server.description "Description Here" \
  -server.headerimage "512x256px JPG/PNG headerimage link here" \
  -server.url "Website Here"
