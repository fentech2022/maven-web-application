FROM maven:3.5-jdk-8-alpine as build 
WORKDIR /app
COPY . .
RUN mvn clean package                
FROM tomcat:8.0.20-jre8
COPY --from=build /app/target/maven-web-application*.war /usr/local/tomcat/webapps/maven-web-application.war 
