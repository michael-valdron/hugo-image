# Hugo Container Image

[![dockerhub Publish CI](https://github.com/michael-valdron/hugo-image/actions/workflows/docker-publish.yaml/badge.svg)](https://github.com/michael-valdron/hugo-image/actions/workflows/docker-publish.yaml)
[![Docker Hub badge][dockerhub-badge]][dockerhub]
[![MIT](https://img.shields.io/badge/license-Apache--2.0-blue)](LICENSE)

 [dockerhub-badge]: https://img.shields.io/docker/pulls/michaelvaldron/hugo
 [dockerhub]: https://hub.docker.com/repository/docker/michaelvaldron/hugo


A container image for using the Hugo CLI command.

## Usage

**Docker**

```sh
docker run --rm -it michaelvaldron/hugo <command>
```

**Podman**

```sh
podman run --rm -it michaelvaldron/hugo <command>
```

### Run Server

```sh
docker run --rm -it -v <project_path>:/project -p 1313:1313 michaelvaldron/hugo server
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.
