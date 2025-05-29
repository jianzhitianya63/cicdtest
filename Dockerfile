# Stage 1: Build the application using Maven (or Gradle)
FROM eclipse-temurin:17-jdk-jammy as builder
WORKDIR /app
COPY .mvn/ .mvn
COPY mvnw pom.xml ./
RUN ./mvnw dependency:resolve # Download dependencies first for better caching
COPY src ./src
RUN ./mvnw package -DskipTests # Build the JAR, skip tests as they should run in CI separately if needed

# Stage 2: Create the final lightweight image
FROM eclipse-temurin:17-jre-jammy
WORKDIR /app
ARG JAR_FILE=target/*.jar
COPY --from=builder /app/${JAR_FILE} application.jar
# Expose the port the application runs on (default for Spring Boot is 8080)
EXPOSE 8080
# Command to run the application
ENTRYPOINT ["java", "-jar", "application.jar"]