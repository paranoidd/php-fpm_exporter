FROM    golang:1.14-buster as builder
RUN     mkdir -p /tmp/build
WORKDIR /tmp/build
COPY    . ./
RUN     go build

FROM       debian:buster-slim
COPY       --from=builder /tmp/build/php-fpm_exporter /bin/php-fpm_exporter
EXPOSE     9308
ENTRYPOINT [ "/bin/php-fpm_exporter" ]
