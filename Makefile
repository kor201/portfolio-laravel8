up:
	docker compose up -d

down:
	docker compose down

logs:
	docker compose logs

npm-install:
	docker compose run --rm node npm ci

npm-reinstall:
	rm -rf ./node_modules
	@make npm-install