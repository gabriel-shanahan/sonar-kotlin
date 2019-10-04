FROM sonarqube:latest
COPY target/sonar-kotlin-1.0.0.jar /opt/sonarqube/extensions/plugins/