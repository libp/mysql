FROM ubuntu:22.10

# add our user and group
RUN groupadd -r mysql && useradd -r -g mysql mysql; \
    apt-get update; \
    apt-get install -y tzdata; \
    apt-get install -y --no-install-recommends net-tools vim gosu wget

# mariadb 10.6
RUN apt-get install -y --no-install-recommends mariadb-server;
    
# set LANG,TZ    
ENV LANG C.UTF-8
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# set user,passwd,delete cached
ENV MARIADB_USER root
ENV MARIADB_PASS 111111
RUN set -eux; \
    ln -fs /bin/bash /bin/sh; \
    rm -rf /var/lib/apt/lists/*;

COPY my.cnf /etc/mysql/mariadb.cnf
COPY db_init.sh /root/

VOLUME /var/lib/mysql

CMD /root/db_init.sh
WORKDIR /var/lib/mysql
EXPOSE 3306