
## KGrid Docker Container


### Build Image
From the 
```docker build -t kgrid-library . ```

### Create Container
Simple 
```docker run -p 8080:8080 --name kgrid-library kgrid-library```

Mapped to local shelf and running in the backgroud
```docker run -p 8080:8080 -v /Users/farrisg/shelf:/home/kgrid/shelf --name kgrid-library -d  kgrid-library ```


### Stop and Start Container

```
docker stop kgrid-library
```

```
docker start kgrid-library
```


### Good to Know

View Logs
```docker logs kgrid-library```


Access container 
```docker exec -it kgrid-library sh```