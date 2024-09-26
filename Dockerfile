FROM openjdk:21-jdk-slim-buster

LABEL authors="helomt"

WORKDIR /app

COPY target/*.jar app.jar

ENV SERVER-PORT=8082

EXPOSE 8082

ENTRYPOINT ["java", "-jar", "app.jar"]