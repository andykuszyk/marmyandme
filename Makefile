build:
	docker build -t marmyandme .

run: build
	docker run --name marmyandme -d -p 8080:80 marmyandme
