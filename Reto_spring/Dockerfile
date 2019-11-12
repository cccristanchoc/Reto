FROM openjdk:8-jdk-alpine
EXPOSE 8080
RUN mkdir -p /app/
ADD build/libs/*.jar /app/reto.jar
ENTRYPOINT ["java", "-jar", "/app/reto.jar"]