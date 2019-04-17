# KGrid Instances
[![Try in PWD](https://raw.githubusercontent.com/play-with-docker/stacks/master/assets/images/button.png)](https://labs.play-with-docker.com/?stack=https://raw.githubusercontent.com/kgrid/kgrid-instances/master/pwd/docker-compose.yml)

## Test (Hippo)
[Hippo](https://github.com/kgrid/kgrid.github.io/wiki/test) is a docker instance create via docker 
compose.  The [hippo docker compose file](https://github.com/kgrid/kgrid-docker/blob/master/hippo/docker-compose.yml) 
creates activator and library service both using file based shelf.

## Sandbox (Monkey)
[Monkey](https://github.com/kgrid/kgrid.github.io/wiki/sandbox) is a docker instance create via docker compose.  
The [monkey docker compose file](https://github.com/kgrid/kgrid-instances/blob/master/monkey/docker-compose.yml) 
creates activator and library service both using file based shelf.

## Production (Lion)
[Monkey](https://github.com/kgrid/kgrid.github.io/wiki/sandbox) is a docker instance create via docker compose.  
The [monkey docker compose file](https://github.com/kgrid/kgrid-instances/blob/master/lion/docker-compose.yml) 
creates activator and library service both using file based shelf.

### Release Instance
1. Create and Push new images for [activator](http://kgrid.org/kgrid-activator/docker/) and/or 
[library](http://kgrid.org/kgrid-library/docker/) as needed. 
1. Update the docker compose file for the instance (hippo or monkey) based on the new images and commit those changes
1. Access [kgrid server](./kgrid-test)
1. Navagate to the kgrid-instances directory and run ```git pull``` to update the docker compose file
1. From the instance directory run ```docker-compose up -d```

### Updating a Shelf
There are some scripts in place that will update the shelfs on each instance.
[chipmunck](./chipmunkupdate.sh)
[hippo](./hippoupdate.sh)
[monkey](./monkeyupdate.sh)
[lion](./lionupdate.sh)

The [create_shelf](./create_shelf.sh)script that will get latest released _cpic-collection_ or tagged release _labwise:1.0.0_ 
assets from git hub and create an shelf import manifest and then call the shelf endpoint with that manifest.

The following would load the hippo library with released KOs
```./create_shelf.sh \
   "http://hippo-activator.kgrid.org http://hippo-library.kgrid.org/shelf" \
   "opioid-collection cpic-collection \
   example-collection:1.1.0 cancer-risk-collection:1.1.0 \
   icon-array:1.0.0 script-numerate:0.3 postpci:1.0.0 labwise:1.0.0"```







