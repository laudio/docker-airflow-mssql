# docker-airflow-mssql

Docker image with airflow and mssql tools including msodbc, sqlcmd and pyodbc.

## Build image

1. Clone this repository.

```bash
# Clone the repository into your desired directory.
$ git clone git@github.com:SafalPandey/docker-airflow-mssql.git
```

2. cd into the cloned repo directory.

```bash
# cd into the directory.
$ cd docker-airflow-mssql
```

3. Build a docker image using this Dockerfile.

```bash
# Build an image with desired image name and tag.
$ docker build -t <image_name>:<tag> .
```

4. Run docker container.

```bash
# Run docker container using the built image.
$ docker run <image_name>
```
