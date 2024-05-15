FROM openjdk:17-alpine

# Install Maven
RUN apk add --no-cache maven

# Set the working directory
WORKDIR /app

# Copy the pom.xml file
COPY pom.xml .

# Copy the rest of the source code
COPY src src

# Build the application
RUN mvn clean package

# Copy the built JAR file
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar

# Expose port 8080
EXPOSE 8080

# Command to run the application
ENTRYPOINT ["java","-jar","app.jar"]

