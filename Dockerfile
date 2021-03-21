FROM amazonlinux:2
WORKDIR /tmp
RUN yum install -y unzip less cronie && \
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install
WORKDIR /root
COPY crontab.txt script.sh entry.sh /
RUN chmod 755 /script.sh /entry.sh
RUN /usr/bin/crontab /crontab.txt

CMD ["/entry.sh"]