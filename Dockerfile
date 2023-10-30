FROM golang:1.21.3-alpine as builder
WORKDIR /src
COPY . .
RUN go build -ldflags '-s -w' -o fullcycle.go


FROM scratch
WORKDIR /
COPY --from=builder /go/src/fullcycle /
CMD [ "./fullcycle" ]


