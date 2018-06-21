# docker-airflow-mssql

Docker image with airflow and mssql tools including msodbc, sqlcmd and pyodbc.

## Build image

1. Clone this repository.

```bash
$ git clone git@github.com:laudio/docker-airflow-mssql.git
```

2. Go to the cloned directory.

```bash
$ cd docker-airflow-mssql
```

3. Build a docker image.

```bash
$ docker build -t <image_name>:<tag> .
```

4. Run docker container.

```bash
$ docker run <image_name>
```
