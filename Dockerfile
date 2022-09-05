# Redhat UBI 9 Micro Image
FROM registry.access.redhat.com/ubi8/openjdk-11-runtime:latest

MAINTAINER panther (jayant.saikia@prospecta.com)

# The following commands are used to extract the jar before commencing docker build
# mkdir target/extracted
# java -Djarmode=layertools -jar target/*.jar extract --destination target/extracted

ARG EXTRACTED=target/extracted
COPY ${EXTRACTED}/dependencies/ ./
COPY ${EXTRACTED}/spring-boot-loader/ ./
COPY ${EXTRACTED}/snapshot-dependencies/ ./
COPY ${EXTRACTED}/application/ ./

ENTRYPOINT ["java","-noverify","-XX:TieredStopAtLevel=1","org.springframework.boot.loader.JarLauncher"]
