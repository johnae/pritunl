FROM ubuntu:14.04

MAINTAINER Jonathan Pares <jonathan.pares@gmail.com>

RUN locale-gen en_US en_US.UTF-8 &&\
    dpkg-reconfigure locales &&\
    ln -sf /usr/share/zoneinfo/UTC /etc/localtime &&\
    echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.0.list &&\
    echo "deb http://repo.pritunl.com/stable/apt trusty main" > /etc/apt/sources.list.d/pritunl.list &&\
    apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 7F0CEB10 &&\
    apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv CF8E292A &&\
    apt-get update -q &&\
    apt-get upgrade -y -q &&\
    apt-get dist-upgrade -y -q &&\
    apt-get install -y software-properties-common python-software-properties iptables &&\
    apt-get install -y pritunl mongodb-org &&\
    apt-get clean &&\
    apt-get -y -q autoclean &&\
    apt-get -y -q autoremove &&\
    rm -rf /tmp/*

ADD start-pritunl /bin/start-pritunl

EXPOSE 9700
EXPOSE 1194
EXPOSE 11194

ENTRYPOINT ["/bin/start-pritunl"]

CMD ["/usr/bin/tail", "-f","/var/log/pritunl.log"]
