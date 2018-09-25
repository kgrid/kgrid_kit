
## KGrid Docker Container


### Build Image


```docker build -t kgrid-activator . ```

### Create Container
Simple 

```docker run -p 8080:8080 --name kgrid-activator kgrid-activator```

Mapped to local shelf and running in the backgroud

```docker run -p 8080:8080 -v /mydirectory/shelf:/home/kgrid/shelf --name kgrid-activator -d  kgrid-activator ```


### Stop and Start Container

```
docker stop kgrid-activator
```

```
docker start kgrid-activator
```

### Good to Know

View Logs

```docker logs kgrid-activator```


Access container 

```docker exec -it kgrid-activator sh```
