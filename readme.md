# KGrid Instances

## Test (Hippo)
[Hippo](https://github.com/kgrid/kgrid.github.io/wiki/test) is a docker instance create via docker compose.  The [hippo docker compose file](https://github.com/kgrid/kgrid-docker/blob/master/hippo/docker-compose.yml) creates activator and library service both using file based shelf.

### Release New Hippo
1. Create and Push new images for [activator](http://kgrid.org/kgrid-activator/docker/) and/or [library](http://kgrid.org/kgrid-library/docker/) as needed. 
1. Update the  The [hippo docker compose file](https://github.com/kgrid/kgrid-docker/blob/master/hippo/docker-compose.yml) based on the new images and commit those changes
1. Access [kgrid server](./kgrid-test)
1. Navagate to the kgrid-docker directory and run ```git pull`` to update the docker compose file
1. From the hippo directory run ```docker-compose up -d --build```

## Sandbox (Monkey)

## Reference

## Fcrepo

### Fcrepop Lite
This image has no Solor,Apache Karaf 4.0.5, Fuseki 2.3.1,Apache Camel. Just Fedora 4.7.5 with a file-based objects database.

Run fcrepo

```docker run --name fcrepo-lite -p 8080:8080 kgrid/fcrepo:4.7.5  ```

Run as container

 ```docker run -it --name fcrepo-lite -p 8080:8080 -d kgrid/fcrepo:4.7.5  ```

Access the restful API

```http://localhost:8080/fcrepo/rest```

Get to a bash shell command line iterface in the docker container

```
docker exec -it fcrepo_test bash
```
Create Volume at ```/usr/local/tomcat/temp``` backups are stored there and easy to move in _golden backups_
```
docker run -it --name fcrepo-lite -p 8080:8080 -v /var/fedora/backup:/usr/local/tomcat/temp -d kgrid/fcrepo:4.7.5
```

[Shelf integration](https://github.com/kgrid/kgrid-shelf#integration-tests) tests use a fcrepo image. This [Fcrepo image](https://hub.docker.com/r/kgrid/fcrepo/) 

## Good to Know 
- [KGrid Docker Hub](https://hub.docker.com/r/kgrid)
- [Fcrepo Labs Docker Image](https://hub.docker.com/r/yinlinchen/fcrepo4-docker/)
- [Fcrepo Labs Docker Image source](https://github.com/fcrepo4-labs/fcrepo4-docker)




