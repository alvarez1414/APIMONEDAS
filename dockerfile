FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean install -DskipTests

FROM openjdk:17-jdk-alpine
#WORKDIR /app
#COPY target/presentacion-0.0.1-SNAPSHOT.jar app.jar --Cuando estaba en la ruta de presentación
COPY app/presentacion/target/presentacion-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 9090
CMD ["java", "-jar", "app.jar"]