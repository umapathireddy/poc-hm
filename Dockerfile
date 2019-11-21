FROM tomcat
COPY **poc-hm**/**target**/hello-1.0.war /usr/local/tomcat/webapps
CMD /usr/local/tomcat/bin/catalina.sh start
