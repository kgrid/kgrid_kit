# KGrid Instances
[![Try in PWD](https://raw.githubusercontent.com/play-with-docker/stacks/master/assets/images/button.png)](https://labs.play-with-docker.com/?stack=https://raw.githubusercontent.com/kgrid/kgrid-instances/master/pwd/docker-compose.yml)

## Test (Hippo)
[Hippo](https://github.com/kgrid/kgrid.github.io/wiki/test) is a docker instance create via docker compose.  The [hippo docker compose file](https://github.com/kgrid/kgrid-docker/blob/master/hippo/docker-compose.yml) creates activator and library service both using file based shelf.

## Sandbox (Monkey)
[Monkey](https://github.com/kgrid/kgrid.github.io/wiki/sandbox) is a docker instance create via docker compose.  The [monkey docker compose file](https://github.com/kgrid/kgrid-instances/blob/master/hippo/docker-compose.yml) creates activator and library service both using file based shelf.

### Release Instance
1. Create and Push new images for [activator](http://kgrid.org/kgrid-activator/docker/) and/or [library](http://kgrid.org/kgrid-library/docker/) as needed. 
1. Update the docker compose file for the instance (hippo or monkey) based on the new images and commit those changes
1. Access [kgrid server](./kgrid-test)
1. Navagate to the kgrid-instances directory and run ```git pull``` to update the docker compose file
1. From the instance directory run ```docker-compose up -d --build```

### Updating a Shelf
Current there are is a create_shelf.sh script that will get released KOs zip files from the objects repo and will import those zip files into a shelf via the shelf API.

The following would load the hidd\ppo library with released KOs
```./create_shelf.sh http://hippo-activator.kgrid.org "opioid-collection:1.1.0 cpic-collection:1.5.3-rc1 example-collection:1.1.0 cancer-risk-collection:1.1.0 icon-array:1.0.0 script-numerate:0.3 postpci:1.0.0 labwise:1.0.0"```







