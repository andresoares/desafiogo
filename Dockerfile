FROM golang:1.19.3-alpine3.16 as build
RUN mkdir /app
ADD . /app
WORKDIR /app
RUN go build -o main .

from scratch
COPY --from=build /app /app
ENTRYPOINT ["/app/main"] 