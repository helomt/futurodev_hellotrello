#Compilador

FROM openjdk:21-jdk-slim-buster AS build

COPY . .

RUN chmod 700 mvnw

RUN ./mvnw clean package

#Executor do codigo compilado

FROM openjdk:21-jdk-slim-buster

WORKDIR app

COPY --from=build target/*.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]