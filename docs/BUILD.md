# Build

* **Tip:** Tag `ghcr.io/chevereto/v3-docker:3.20-php7.4` to override the [ghcr package](https://github.com/orgs/chevereto/packages?repo_name=docker) with local

```sh
docker build -t ghcr.io/chevereto/v3-docker:3.20-php7.4 . \
    -f httpd-php.Dockerfile
```

* For custom tag: Replace `tag` with your own.

```sh
docker build -t chevereto/httpd-php:tag . \
    -f httpd-php.Dockerfile
```
