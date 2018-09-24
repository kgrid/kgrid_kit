
## KGrid Docker Container


### Build Image
From the 
```docker build -t kgrid . ```

### Create Container
Simple 
```docker run -p 8080:8080 --name kgrid kgrid```

Mapped to local shelf and running in the backgroud
```docker run -p 8080:8080 -v /Users/farrisg/shelf:/home/kgrid/shelf --name kgrid -d  kgrid ```


### Stop and Start Container

```
docker stop kgrid
```

```
docker start kgrid
```


### Good to Know

View Logs
```docker logs kgrid```


Access container 
```docker exec -it kgrid sh```