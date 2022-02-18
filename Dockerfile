FROM maven:3.8.4-openjdk-11-slim

WORKDIR /app

COPY pom.xml /app/

RUN mvn validate

RUN mvn install

RUN mvn dependency:copy-dependencies package
