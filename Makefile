.PHONY: build
build:
	docker build -t flowdiagram -f Dockerfile .

.PHONY: run
run:
	docker run -d -p 3003:3000 --rm --name flowdiagram flowdiagram || :

.PHONY: exec
exec:
	docker exec -it flowdiagram /bin/bash || :

.PHONY: stop
stop:
	docker stop flowdiagram || :

.PHONY: logs
logs:
	docker logs -f flowdiagram || :
