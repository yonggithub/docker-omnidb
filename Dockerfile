FROM debian:stable-slim

RUN  apt-get update \
  && apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir /app
WORKDIR /app

RUN wget https://omnidb.org/dist/2.12.0/omnidb-server_2.12.0-debian-amd64.deb

RUN dpkg -i /app/omnidb-server_2.12.0-debian-amd64.deb


RUN  apt-get update \
  && apt-get install -y libaio1 unzip \
  && rm -rf /var/lib/apt/lists/*
  
ADD instantclient-basic-linux.x64-12.2.0.1.0.zip /app

RUN unzip -q instantclient-basic-linux.x64-12.2.0.1.0.zip
 
ENV LD_LIBRARY_PATH=/app/instantclient_12_2:$LD_LIBRARY_PATH

EXPOSE 8000
EXPOSE 25482

CMD ["omnidb-server"]
