help:
	@echo 'make help   : Show this message'
	@echo 'make run    : Start the server'
	@echo 'make build  : Build the "main" executable in the current directory'
	@echo 'make clean  : Cleans the Golang workspace'
	@echo 'make test   : Runs tests'
	@echo 'make docker : Builds the Docker image and starts a container'

build:
	go build -o main main.go

run:
	go run main.go "$(shell pwd)/resources/"

clean:
	go clean

test:
	go test ./...

docker:
	docker build -t personality_quiz .
	docker run -p 8080:8080 -d personality_quiz