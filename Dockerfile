FROM python:3.7-stretch

RUN echo deb http://ftp.jp.debian.org/debian/ sid main >> /etc/apt/sources.list && \
    echo deb-src http://ftp.jp.debian.org/debian/ sid main >> /etc/apt/sources.list
RUN apt-get update -y && apt-get install -y docker.io mysql-client

RUN curl "https://d1vvhvl2y92vvt.cloudfront.net/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install

RUN curl "https://releases.hashicorp.com/terraform/0.12.20/terraform_0.12.20_linux_amd64.zip" -o "terraform_0.12.20_linux_amd64.zip" && \
    unzip terraform_0.12.20_linux_amd64.zip && \
    mv terraform /usr/bin/terraform

RUN pip install awscli

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
    apt-get install -y nodejs

