FROM centos:centos7.1.1503
LABEL maitainer="misyobun <misyobun@misyobun.com>"
ENV container docker
RUN yum swap -y fakesystemd systemd && yum clean all && \
    yum update -y && yum clean all && \
    yum install -y epel-release && yum clean all && \
    yum install -y nginx && yum clean all && \
    yum clean all && \
    ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
ADD nginx.conf /etc/nginx/
ADD default.conf /etc/nginx/conf.d/
RUN echo "Hey! Nginx!" > /usr/share/nginx/html/index.html
RUN systemctl enable nginx
EXPOSE 80
