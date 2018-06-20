FROM puckel/docker-airflow:1.8.0

USER root

RUN apt-get update && apt-get install -y \
	curl apt-transport-https debconf-utils \
    && rm -rf /var/lib/apt/lists/*

RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl https://packages.microsoft.com/config/debian/8/prod.list > /etc/apt/sources.list.d/mssql-release.list

# install SQL Server drivers and tools
ENV ACCEPT_EULA=Y

RUN apt-get update && apt-get upgrade -y libc6

RUN apt-get install -y msodbcsql mssql-tools unixodbc-dev
RUN echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc
RUN /bin/bash -c "source ~/.bashrc"

RUN pip install --upgrade six
RUN pip install pyodbc

USER airflow
