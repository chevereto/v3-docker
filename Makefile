
dev: dev--down--volumes
	@SOURCE=~/git/chevereto/v3 \
	docker-compose \
		-p chevereto-v3-dev \
		-f httpd-php-dev.yml \
		up -d
	@docker exec -it \
		chevereto-v3-dev_bootstrap \
		bash /var/www/sync.sh
	@docker exec --user www-data -it \
		chevereto-v3-dev_bootstrap \
		composer install \
			--prefer-dist \
			--no-progress \
			--classmap-authoritative \
			--ignore-platform-reqs
	@docker exec -it --user www-data \
		chevereto-v3-dev_bootstrap \
		php /var/www/html/cli.php -C install \
			-u admin \
			-e admin@chevereto.loc \
			-x password
	@echo "👉 admin:password http://localhost:8930"

dev--up:
	@SOURCE=~/git/chevereto/v3 \
	docker-compose \
		-p chevereto-v3-dev \
		-f httpd-php-dev.yml \
		up -d
	@echo "👉 http://localhost:8930"

dev--down:
	@SOURCE=~/git/chevereto/v3 \
	docker-compose \
		-p chevereto-v3-dev \
		-f httpd-php-dev.yml \
		down
	@echo "👉 Volumes keept"

dev--down--volumes:
	@SOURCE=~/git/chevereto/v3 \
	docker-compose \
		-p chevereto-v3-dev \
		-f httpd-php-dev.yml \
		down --volumes
	@echo "👉 Volumes destroyed"

dev--demo:
	@docker exec -it \
		chevereto-v3-dev_bootstrap \
		bash /var/www/demo-importing.sh
	@docker exec -it --user www-data \
		chevereto-v3-dev_bootstrap \
		php cli.php -C importing
	@echo "👉 http://localhost:8930"
