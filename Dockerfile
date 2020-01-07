FROM adoptopenjdk/openjdk8-openj9
RUN apt-get update && \
    apt-get install -y maven
WORKDIR /project
COPY . /project
RUN mvn -X initialize process-resources verify
RUN mvn clean package
#RUN mvn --version
ENTRYPOINT ["java","-jar","/project/target/demoapp-0.0.1-SNAPSHOT.jar"]
