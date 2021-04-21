FROM openjdk:8-jre-alpine

RUN addgroup -S spring-boot && adduser -S spring-boot -G spring-boot

USER spring-boot

VOLUME /tmp

ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar

ENTRYPOINT ["sh", "-c", "java ${JAVA_OPTS} -jar /app.jar ${0} ${@}"]
