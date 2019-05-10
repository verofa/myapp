FROM alpine:3.9

WORKDIR /

COPY ./myapp.py . 

RUN apk add --update python

EXPOSE 80

ENTRYPOINT [ "./myapp.py" ]
