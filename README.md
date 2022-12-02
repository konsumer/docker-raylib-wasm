# konsumer/raylib-wasm

This is a simplified setup for your raylib game that uses docker, so you don't have to install anything, and it will work on every environment. It features a live-reloading local server, and can also build as a website.


## usage

Put your c/h files in `src/`, and your assets in `assets/`, then use it like this:

```sh
# build website in build/
docker run -v $(pwd):/src --rm -it konsumer/raylib-wasm

# run live-reloading server
docker run -p 8000:8000 -v $(pwd):/src --rm -it konsumer/raylib-wasm watch
```

If you need to customize how things are built, you can put your own `CMakeLists.txt` and it will be used instead of [mine](./CMakeLists.txt).

You can also customize the [webroot/](webroot) by making your own.

## development

build & publish like this:

```sh
docker build -t raylib-wasm .
docker push raylib-wasm
```

For just local testing:

```sh
docker build -t raylib-wasm .
docker run -p 8000:8000 -v $(pwd):/src -it --rm raylib-wasm bash
```
