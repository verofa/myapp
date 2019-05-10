FROM alpine:3.9

WORKDIR /

COPY ./myapp.py . 

RUN chmod +x myapp.py

RUN ls -la 

RUN apk add --update python

EXPOSE 80

ENTRYPOINT [ "./myapp.py" ]
