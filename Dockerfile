FROM --platform=linux/amd64 alpine

COPY entrypoint.sh /usr/local/bin/docker-entrypoint.sh
COPY CMakeLists.txt /usr/local/share/CMakeLists.txt

RUN apk add --no-cache git make cmake python3 nodejs

# install emscripten SDK
RUN git clone --depth=1 https://github.com/emscripten-core/emsdk.git /emsdk && cd /emsdk && ./emsdk install latest && ./emsdk activate latest


WORKDIR /src
CMD []