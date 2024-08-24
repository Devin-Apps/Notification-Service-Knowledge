# Build stage
FROM openjdk:11-jdk-slim AS build
WORKDIR /app
COPY . .
RUN apt-get update && apt-get install -y maven
RUN mvn clean package

# Run stage
FROM openjdk:11-jre-slim
WORKDIR /app
COPY --from=build /app/target/notification-service-1.0-SNAPSHOT.jar /app/notification-service.jar
COPY --from=build /app/config.yml /app/config.yml
EXPOSE 8080
CMD ["java", "-jar", "notification-service.jar", "server", "config.yml"]
