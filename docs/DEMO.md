# Demo

## Build demo assets

Run this command to import [demo-importing](https://github.com/chevereto/demo-importing) project assets to `/var/www/html/importing`.

* chevereto-v3_bootstrap

```sh
docker exec -it \
    chevereto-v3_bootstrap \
    bash /var/www/demo-importing.sh
```

* chevereto-v3-dev_bootstrap

```sh
docker exec -it \
    chevereto-v3-dev_bootstrap \
    bash /var/www/demo-importing.sh
```

## Import

Run the [Bulk Content Importer](https://v3-docs.chevereto.com/features/content/bulk-content-importer.html).

* chevereto-v3_bootstrap

```sh
docker exec -it --user www-data \
    chevereto-v3_bootstrap \
    php cli.php -C importing
```

* chevereto-v3-dev_bootstrap

```sh
docker exec -it --user www-data \
    chevereto-v3-dev_bootstrap \
    php cli.php -C importing
```
