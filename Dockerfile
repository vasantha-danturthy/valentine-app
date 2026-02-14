# ---- Build Stage ----
    FROM maven:3.9.6-eclipse-temurin-21 AS build

    WORKDIR /app
    
    COPY pom.xml .
    RUN mvn dependency:go-offline
    
    COPY src ./src
    
    RUN mvn clean package -DskipTests
    
    # ---- Run Stage ----
    FROM eclipse-temurin:21-jdk-alpine
    
    WORKDIR /app
    
    COPY --from=build /app/target/vdw-0.0.1-SNAPSHOT.jar app.jar
    
    EXPOSE 8080
    
    CMD ["java", "-jar", "app.jar"]
    