#FROM openjdk:8-jdk-alpine
#RUN addgroup -S spring && adduser -S spring -G spring
#USER spring:spring
#ARG JAR_FILE=hello-service/build/libs/*.jar
#COPY ${JAR_FILE} app.jar
#ENTRYPOINT ["java","-jar","/app.jar"]


FROM gradle:5.1.0-jdk8-alpine AS build
ARG JAR_FILE=hello-service/build/libs/*.jar
WORKDIR /javaapp
COPY --chown=gradle:gradle . .
RUN gradle bootJar
RUN ls hello-service/build/libs/
COPY ${JAR_FILE}  /output/app.jar


FROM openjdk:8-jre-slim
COPY --from=build /output .
RUN ls
EXPOSE 8080
ENTRYPOINT ["java","-jar","app.jar"]
