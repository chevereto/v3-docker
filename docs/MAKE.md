# Make

[Makefile](../Makefile) provides commands for managing multiple container provisioning.

*Note:* Pass `DOCKER_USER=<user>` to set the user for run commands. Default `www-data`.

```sh
make <command> <VERSION=4.0 PHP=8.1 DOCKER_USER=www-data ... >
```

Default values:

* DOCKER_USER=www-data
* PHP=8.1
* TARGET=dev
* VERSION=4.0

## Dev

A dev instance is used when you have a Chevereto project in your system (`SOURCE` argument). A Chevereto project is any folder containing Chevereto code, including your own modified versions.

💡 It requires a Chevereto project.

* To build a new dev instance:

> Note: This command will destroy any previous `dev` instance (including its volumes).

```sh
make dev
```

### Dev demo

Implement demo on `dev`

```sh
make dev--demo
```

### Dev up

Bring the containers up (start).

```sh
dev--up
```

### Dev down

Take the containers down (stop).

```sh
dev--down--volumes
```

### Dev down volumes

Same as [Dev down](#dev-down), but removes all data.

```sh
dev--down--volumes
```
