build:
	go build -o main main.go

run:
	go run main.go

clean:
	go clean

test:
	go test ./...

docker:
	docker build -t personality_quiz .
	docker run -p 8080:8080 -d personality_quiz 