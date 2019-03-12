FROM wiremind/omnidb

RUN  apt-get update \
  && apt-get install -y libaio1 unzip \
  && rm -rf /var/lib/apt/lists/*
  
ADD instantclient-basic-linux.x64-12.2.0.1.0.zip /app

RUN unzip -q instantclient-basic-linux.x64-12.2.0.1.0.zip
 
ENV LD_LIBRARY_PATH=/app/instantclient_12_2:$LD_LIBRARY_PATH

