FROM puckel/docker-airflow:1.9.0-4

USER root

RUN apt-get update && apt-get install -y \
    --reinstall build-essential \
    gnupg2 \
    curl apt-transport-https debconf-utils \
    && rm -rf /var/lib/apt/lists/*

RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
    curl https://packages.microsoft.com/config/debian/8/prod.list > /etc/apt/sources.list.d/mssql-release.list

# Install SQL Server drivers and client tools.
ENV ACCEPT_EULA=Y
RUN apt-get update && \
    apt-get upgrade -y libc6 && \
    apt-get install -y msodbcsql mssql-tools unixodbc-dev

# Install python dependencies.
RUN echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc
RUN /bin/bash -c "source ~/.bashrc" && \
    pip install --upgrade six && \
    pip install pyodbc

USER airflow
