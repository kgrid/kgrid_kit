
## KGrid Docker Containers


### Activator

[Activator Docker file](./activator/readme.md)

### Library
 
[Library Docker file](./library/readme.md)

### Fcrepo

#### Fcrepop Lite
This image has no Solor,Apache Karaf 4.0.5, Fuseki 2.3.1,Apache Camel. Just Fedora 4.7.5 with a file-based objects database.

Run fcrepo

```docker run -p 8080:8080 kgrid/fcrepo:4.7.5  ```

Run as container

 ```docker run -it -p 8080:8080 -d kgrid/fcrepo:4.7.5  ```

Access the restful API

```http://localhost:8080/fcrepo/rest```

Get to a bash shell command line iterface in the docker container

```
docker exec -it fcrepo_test bash
```
Create Volume at ```/usr/local/tomcat/temp``` backups are stored there and easy to move in _golden backups_
```
docker run -it -p 8080:8080 -v /Users/farrisg/fedora:/usr/local/tomcat/temp -d kgrid/fcrepo:4.7.5
```


[Shelf integration](https://github.com/kgrid/kgrid-shelf#integration-tests) tests use a fcrepo image. This [Fcrepo image](https://hub.docker.com/r/kgrid/fcrepo/) 

#### Good to Know 
- [KGrid Docker Hub](https://hub.docker.com/r/kgrid)
- [Fcrepo Labs Docker Image](https://hub.docker.com/r/yinlinchen/fcrepo4-docker/)
- [Fcrepo Labs Docker Image source](https://github.com/fcrepo4-labs/fcrepo4-docker)




