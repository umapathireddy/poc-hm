FROM tomcat
COPY /target/hello-1.0-RELEASES.war /usr/local/tomcat/webapps
CMD /usr/local/tomcat/bin/catalina.sh start
