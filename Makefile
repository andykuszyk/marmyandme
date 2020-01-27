build:
	docker build -t marmyandme .

run:
	docker-compose down
	docker-compose up -d --build

watch:
	find . | grep -v .git | grep -v swp | entr -c make run
