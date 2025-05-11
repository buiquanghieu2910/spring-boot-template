# Stage 1: Build the Java application
FROM maven:3.8.4-openjdk-17 AS builder

# Copy the source code to the container
WORKDIR /app
COPY . .

# Build the application
RUN mvn clean package -DskipTests

# Stage 2: Create the production image
FROM eclipse-temurin:17-jdk-focal

# Copy the JAR file from the previous stage
COPY --from=builder /app/target/*.jar /app/app.jar

# Expose port 8080
EXPOSE 8080

# Specify the command to run your application
ENTRYPOINT ["java", "-jar", "/app.jar"]