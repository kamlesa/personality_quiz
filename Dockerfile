FROM golang:latest AS builder
WORKDIR /app
COPY go.mod .
COPY . ./
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .

FROM alpine:latest
RUN apk --no-cache add ca-certificates
WORKDIR /app
COPY ./resources ./resources
COPY --from=builder /app/main ./
EXPOSE 8080

ENTRYPOINT ["/app/main"]