FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

ENV TZ=UTC
ENV DB_ENGINE='sqlite'
ENV DB_NAME='test'

# ENV MYSQL_ROOT_PASSWORD=adminpass
# ENV MYSQL_USER=master
# ENV MYSQL_PASSWORD=password
# ENV MYSQL_DATABASE=test
# ENV MYSQL_ALLOW_EMPTY_PASSWORD=yes

RUN apt-get update && apt-get install -y nginx python3 python3-pip sqlite3

# COPY db/CreateDB.sql /docker-entrypoint-initdb.d/CreateDB.sql
# # RUN mysql -u ${MYSQL_USER} -p${MYSQL_PASSWORD} /db/CreateDB.sql
COPY web/default /etc/nginx/sites-enabled/default
COPY app /app
WORKDIR /app
RUN pip install -r requirements.txt
RUN sqlite3 ${DB_NAME} 'CREATE TABLE IF NOT EXISTS todo (id INTEGER NOT NULL, content VARCHAR(200) NOT NULL, date_created DATETIME, PRIMARY KEY (id));'

EXPOSE 80

COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh
ENTRYPOINT [ "bash","-c","./start.sh" ]
# docker run -d --name mysql-container -e TZ=UTC -p 30306:3306 -e MYSQL_ROOT_PASSWORD=My:S3cr3t/ ubuntu/mysql:8.0-21.10_beta


