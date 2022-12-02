# only amd64 is supported by emscripten, apparently
FROM --platform=linux/amd64 debian:bullseye

COPY entrypoint.sh /usr/local/bin/docker-entrypoint.sh
COPY CMakeLists.txt /usr/local/share/raylib-wasm/CMakeLists.txt
COPY webroot /usr/local/share/raylib-wasm/webroot

RUN apt update && apt upgrade -y && apt install -y emscripten cmake git && apt clean && emcc -v

RUN git clone --depth=1 https://github.com/raysan5/raylib.git /raylib && cd /raylib/src/ && make PLATFORM=PLATFORM_WEB && make install

WORKDIR /src/
ENTRYPOINT /usr/local/bin/docker-entrypoint.sh
