FROM golang:1.23-alpine AS builder

WORKDIR /app

# Install templ
RUN go install github.com/a-h/templ/cmd/templ@latest

# Copy go mod files first for caching
COPY go.mod go.sum ./
RUN go mod download

# Copy source files
COPY *.go ./
COPY *.templ ./

# Generate templ files and build
RUN templ generate
RUN CGO_ENABLED=0 GOOS=linux go build -o portfolio .

# Final stage
FROM alpine:latest

WORKDIR /app

COPY --from=builder /app/portfolio .
COPY config.yaml .

EXPOSE 8080

CMD ["./portfolio"]
