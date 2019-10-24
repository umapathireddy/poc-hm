FROM tomcat
COPY /var/lib/jenkins/workspace/poc/target/hello-1.0.war /usr/local/tomcat/webapps/
