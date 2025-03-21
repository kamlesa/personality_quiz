FROM golang:latest AS builder
WORKDIR /app
COPY go.mod .
COPY . ./
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .

FROM alpine:latest
RUN apk --no-cache add ca-certificates
COPY --from=builder /app/main .
WORKDIR /app
EXPOSE 8080

ENTRYPOINT ["main"]