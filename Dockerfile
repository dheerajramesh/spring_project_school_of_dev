FROM schoolofdevops/maven:spring as build 

WORKDIR /app

COPY .  .

RUN mvn spring-javaformat:apply && \
    mvn package -DskipTests  
   # mv target/spring-petclinic-2.3.1.BUILD-SNAPSHOT.jar /run/petclinic.jar

FROM openjdk:8-jdk-alpine as run

WORKDIR /app
#mv target/spring-petclinic-2.3.1.BUILD-SNAPSHOT.jar /run/petclinic.jar

EXPOSE 8080 
COPY --from=build /app/target/spring-petclinic-2.3.1.BUILD-SNAPSHOT.jar  .	
#CMD java  -jar /run/petclinic.jar

CMD java -jar spring-petclinic-2.3.1.BUILD-SNAPSHOT.jar
#CMD java -jar target/*.jar
