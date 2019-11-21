FROM tomcat
COPY . /home/runner/work/poc-hm/poc-hm/target/hello-1.0.war /usr/local/tomcat/webapps
CMD /usr/local/tomcat/bin/catalina.sh start
