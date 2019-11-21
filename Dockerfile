FROM tomcat
COPY . /usr/local/tomcat/webapps
CMD /usr/local/tomcat/bin/catalina.sh start
