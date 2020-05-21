FROM mysql/mysql-server:5.7
ENV MYSQL_ALLOW_EMPTY_PASSWORD="yes"
ENV MYSQL_DATABASE=grumpyipsum
ENV MYSQL_ROOT_PASSWORD=docker
ENV MYSQL_LOG_CONSOLE=true
#ENV MYSQL_USER=webserver
#ENV MYSQL_PASSWORD=webserver
COPY my.cnf /etc/mysql/my.cnf
COPY setup.sql /docker-entrypoint-initdb.d/
EXPOSE 3306