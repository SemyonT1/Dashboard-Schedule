FROM golang:1.24.2 AS builder

WORKDIR /Dashboard_Schedule
COPY backend/go.mod backend/go.sum ./
RUN go mod download

COPY backend/ . 
RUN go build -o server ./cmd/server

FROM golang:latest
WORKDIR /Dashboard_Schedule
COPY --from=builder /Dashboard_Schedule/server .
CMD [ "./server" ]