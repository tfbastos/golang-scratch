FROM golang:1.21.3-alpine as builder
WORKDIR /go/src/golang
COPY /src .
RUN go build -ldflags '-s -w' -o fullcycle

FROM scratch
WORKDIR /
COPY --from=builder /go/src/golang /
CMD [ "./fullcycle" ]
