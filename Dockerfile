FROM puckel/docker-airflow:1.10.2

USER root

ENV ACCEPT_EULA=Y

RUN apt-get update && apt-get install -y \
    gnupg2 \
    curl apt-transport-https debconf-utils && \
    echo "deb http://deb.debian.org/debian jessie main" >> /etc/apt/sources.list && \
    curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
    curl https://packages.microsoft.com/config/debian/8/prod.list > /etc/apt/sources.list.d/mssql-release.list && \
    apt-get update && \
    apt-get upgrade -y libc6 && \
    apt-get install -y \
        msodbcsql \
        mssql-tools \
        unixodbc-dev \
        libssl1.0.0  && \
    apt-get install -y --reinstall --upgrade \
        g++ \
        gcc && \
    /bin/bash -c "source ~/.bashrc" && \
    pip install --upgrade \
        six \
        pyodbc \
        psycopg2-binary && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

USER airflow

RUN pip install fabric3 flask_bcrypt slackclient boto3 xlrd hvac==0.6.4 --user

ENV PATH="$PATH:/opt/mssql-tools/bin:/usr/local/airflow/.local/bin"
