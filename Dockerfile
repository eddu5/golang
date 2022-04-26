FROM golang:1.17-alpine as build_base

WORKDIR /usr/src/app

COPY . .

RUN go mod init example/dockergo

RUN go build 

FROM scratch as execute

WORKDIR /usr/src/app

COPY --from=build_base /usr/src/app/dockergo .

CMD ["./dockergo"]