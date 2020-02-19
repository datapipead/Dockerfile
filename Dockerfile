FROM python:3.7-stretch

RUN echo deb http://ftp.jp.debian.org/debian/ sid main >> /etc/apt/sources.list && \
    echo deb-src http://ftp.jp.debian.org/debian/ sid main >> /etc/apt/sources.list
RUN apt-get update -y && apt-get install -y docker.io


RUN curl "https://d1vvhvl2y92vvt.cloudfront.net/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install

CMD ["service", "docker", "start"]
