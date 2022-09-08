
dev:
	@SOURCE=~/git/chevereto/v3 \
	docker-compose \
		-p chevereto-v3-dev \
		-f httpd-php-dev.yml \
		up -d

dev--demo:
	@docker exec -it \
		chevereto-v3-dev_bootstrap \
		bash /var/www/demo-importing.sh
	@docker exec -it --user www-data \
		chevereto-v3-dev_bootstrap \
		php cli.php -C importing
