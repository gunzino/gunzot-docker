FROM mysql:5.7
ENV MYSQL_ROOT_PASSWORD password
ENV MYSQL_DATABASE gunzodus

RUN echo "mysql -u root -p$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE < /root/scheme.sql" > /docker-entrypoint-initdb.d/init.sh
RUN chmod 755 /docker-entrypoint-initdb.d/init.sh
RUN chmod 755 /root
