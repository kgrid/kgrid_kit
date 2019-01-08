# KGrid Instances

## Test (Hippo)
[Hippo](https://github.com/kgrid/kgrid.github.io/wiki/test) is a docker instance create via docker compose.  The [hippo docker compose file](https://github.com/kgrid/kgrid-docker/blob/master/hippo/docker-compose.yml) creates activator and library service both using file based shelf.

### Release New Hippo
1. Create and Push new images for [activator](http://kgrid.org/kgrid-activator/docker/) and/or [library](http://kgrid.org/kgrid-library/docker/) as needed. 
1. Update the  The [hippo docker compose file](https://github.com/kgrid/kgrid-instances/blob/master/hippo/docker-compose.yml) based on the new images and commit those changes
1. Access [kgrid server](./kgrid-test)
1. Navagate to the kgrid-instances directory and run ```git pull``` to update the docker compose file
1. From the hippo directory run ```docker-compose up -d --build```

```docker-compose down```
```docker-compose logs```

## Sandbox (Monkey)
[Monkey](https://github.com/kgrid/kgrid.github.io/wiki/sandbox) is a docker instance create via docker compose.  The [monkey docker compose file](https://github.com/kgrid/kgrid-instances/blob/master/hippo/docker-compose.yml) creates activator and library service both using file based shelf.

## Reference
[Reference](https://github.com/kgrid/kgrid.github.io/wiki/test) is a docker instance create via docker compose.  The [reference docker compose file](https://github.com/kgrid/kgrid-instances/blob/master/hippo/docker-compose.yml) creates activator and library service both using file based shelf.





