FROM openjdk:8-jre-alpine

EXPOSE 8080

COPY ./target/*.war /usr/app/
WORKDIR /usr/app

CMD java  *.war