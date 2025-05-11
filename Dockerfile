# Sử dụng OpenJDK 17 Alpine làm base image
FROM openjdk:17-jdk-alpine

# Đặt thư mục làm việc trong container
WORKDIR /app

# Copy file JAR từ target vào container
COPY target/*.jar app.jar

# Expose cổng 8080
EXPOSE 8080

# Chạy ứng dụng Spring Boot
ENTRYPOINT ["java", "-jar", "/app.jar"]
