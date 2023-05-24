FROM ubuntu:22.10

# set LANG,TZ,user,passwd
ENV LANG C.UTF-8
ENV TZ=Asia/Shanghai
ENV MARIADB_USER root
ENV MARIADB_PASS 111111

RUN groupadd -r mysql && useradd -r -g mysql mysql; \
    apt-get update; \
    apt-get install -y tzdata; \
    apt-get install -y --no-install-recommends nvi mariadb-server; \
    ln -fs /bin/bash /bin/sh; \
    rm -rf /var/lib/apt/lists/*; \
    rm -rf /var/lib/mysql; \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY my.cnf /etc/mysql/mariadb.cnf
COPY db_init.sh /root/

VOLUME /var/lib/mysql
CMD /root/db_init.sh
WORKDIR /root
EXPOSE 3306