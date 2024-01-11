build:
	docker build -t gb .
run:
	docker run -p 8080:8080 -p 1989:1989 gb
