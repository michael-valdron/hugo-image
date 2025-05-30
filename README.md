# Hugo Container Image

[![Go 1.24](https://img.shields.io/badge/1.24-blue?logo=go&labelColor=gray)](https://go.dev/doc/go1.24)
[![Go 1.23](https://img.shields.io/badge/1.23-blue?logo=go&labelColor=gray)](https://go.dev/doc/go1.23)
[![Hugo Latest](https://img.shields.io/badge/latest-cb4879?logo=hugo&labelColor=gray)](https://github.com/gohugoio/hugo/releases/latest)
[![Publish CI](https://github.com/michael-valdron/hugo-image/actions/workflows/publish.yaml/badge.svg)](https://github.com/michael-valdron/hugo-image/actions/workflows/publish.yaml)
[![Docker Hub badge][dockerhub-badge]][dockerhub]
[![Docker Repository on Quay](https://quay.io/repository/michaelvaldron/hugo/status "Docker Repository on Quay")](https://quay.io/repository/michaelvaldron/hugo)
[![Apache-2.0](https://img.shields.io/badge/license-Apache--2.0-blue)](LICENSE)

 [dockerhub-badge]: https://img.shields.io/docker/pulls/michaelvaldron/hugo
 [dockerhub]: https://hub.docker.com/r/michaelvaldron/hugo


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
docker run --rm -it -v <project_path>:/project -p 1313:1313 michaelvaldron/hugo hugo server
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

### Deprecated Go Version Support

Here is a list of Go versions that was past supported and can be manually built:

- [Go 1.22 (support deprecated 2025-03-08)](build/go1.22)
- [Go 1.21 (support deprecated 2025-01-26)](build/go1.21)
