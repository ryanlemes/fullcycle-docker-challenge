FROM golang:1.17-alpine as builder

ENV GOOS=linux \
    GOARCH=amd64

WORKDIR /app

COPY . .

RUN go build -o fullcyle .

FROM scratch as final

COPY --chown=0:0 --from=builder /app/fullcyle /fullcyle

ENTRYPOINT [ "/fullcyle" ]
