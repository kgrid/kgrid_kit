# KGrid Instances
[![Try in PWD](https://raw.githubusercontent.com/play-with-docker/stacks/master/assets/images/button.png)](https://labs.play-with-docker.com/?stack=https://raw.githubusercontent.com/kgrid/kgrid-instances/master/pwd/docker-compose.yml)

## Integration (Chipmunk)
[Chipmunk](https://github.com/kgrid/kgrid.github.io/wiki/integration) is a [heroku](https://dashboard.heroku.com) instance.

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

## Deploy an Instance
1. Create and Push new images for [activator](http://kgrid.org/kgrid-activator/docker/) and/or 
[library](http://kgrid.org/kgrid-library/docker/) as needed. 
1. Update the docker compose file for the instance (hippo or monkey) based on the new images and commit those changes
1. Access [kgrid server](./kgrid-test)
1. Navagate to the kgrid-instances _/usr/local/miserver/kgrid/kgrid-instances_ directory and run ```git pull``` to update the docker compose file
1. From the instance directory run ```docker-compose up -d```

## Updating a Shelf
There are some scripts in place that will update the shelfs on each instance.
1. [chipmunck](chipmunk/shelfupdate.sh)
1. [hippo](./hippo/shelfupdate.sh)
1. [monkey](./monkey/shelfupdate.sh)
1. [lion](./lion/shelfupdate.sh)

The [create_shelf](./create_shelf.sh)script that will get latest released _cpic-collection_ or tagged release _labwise:1.0.0_ 
assets from git hub and create an shelf import manifest and then call the shelf endpoint with that manifest.

The following would load the hippo library with released KOs
```
 ./create_shelf.sh \
   "http://hippo-activator.kgrid.org http://hippo-library.kgrid.org/shelf" \
   "opioid-collection cpic-collection \
   example-collection:1.1.0 cancer-risk-collection:1.1.0 \
   icon-array:1.0.0 script-numerate:0.3 postpci:1.0.0 labwise:1.0.0"
```

## Acceptance Testing
There is a simple Postman Acceptance Testing collection in the accpetance_test directory.  Using newman we can run 
the collection passing in correct environment chipmunk, hippo, monkey, lion 

example of acceptance test for activator on chipmunk
```
npm install
npm run test-chipmunk
```

### Good To Know

- Lion environment is using named volumes for the library and activator shelves.  

- View the volumes 
``` docker volume ls ``` 

- Rebuild with empty volumes
```docker-compose up -d -v ```

- View docker daemon logs 
```sudo journalctl -u docker.service```







