# Run Application as monolith (in single docker container)

```shell
docker build -t taskmaster:latest .

docker run -itd --name taskmaster -p 80:80 taskmaster:latest
```

# Run Application as 3-tier (in docker-compose)

```shell
docker-compose --project-name TaskMaster up -d --build

docker-compose --project-name TaskMaster down --remove-orphans -v
```