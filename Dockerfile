FROM ubuntu:14.04

MAINTAINER John Axel Eriksson <john@insane.se>

RUN locale-gen en_US en_US.UTF-8 &&\
    dpkg-reconfigure locales &&\
    ln -sf /usr/share/zoneinfo/UTC /etc/localtime &&\
    apt-get update -q &&\
    apt-get upgrade -y -q &&\
    apt-get dist-upgrade -y -q &&\
    apt-get install -y software-properties-common python-software-properties &&\
    add-apt-repository ppa:pritunl/ppa &&\
    apt-get update -q &&\
    apt-get install -y pritunl &&\
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
