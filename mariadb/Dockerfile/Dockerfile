FROM mariadb:10.4

RUN apt-get update
RUN apt-get -y install locales-all

# DB設定ファイル転送 主に文字コード
COPY ./mariadb/conf/server.cnf /etc/my.cnf.d/server.cnf
COPY ./mariadb/conf/client.cnf /etc/my.cnf.d/client.cnf
COPY ./mariadb/conf/mysql-clients.cnf /etc/my.cnf.d/mysql-clients.cnf

EXPOSE 3306
