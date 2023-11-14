# Use AdoptOpenJDK 11 image as the base image
FROM adoptopenjdk:11-jdk-hotspot-bionic

# Set the working directory
WORKDIR /app

# Copy the Gradle wrapper files to the container
COPY gradlew /app/
COPY gradle /app/gradle

# Copy the rest of the application files
COPY . /app/

# Grant execute permission for gradlew
RUN chmod +x /app/gradlew

# Set up JDK 11
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        unzip \
        && rm -rf /var/lib/apt/lists/*

# Run Gradle build
RUN ./gradlew build

# Your additional Dockerfile steps go here

# Specify the command to run on container start
CMD ["java", "-jar", "your-application.jar"]
