FROM golang:1.16-alpine AS build
WORKDIR /app
COPY . .
RUN go build -o app main.go

FROM alpine
WORKDIR /app
COPY --from=build /app /app
ENTRYPOINT ["./app"]