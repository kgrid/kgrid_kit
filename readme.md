# KGrid Instances
[![Try in PWD](https://raw.githubusercontent.com/play-with-docker/stacks/master/assets/images/button.png)](https://labs.play-with-docker.com/?stack=https://raw.githubusercontent.com/kgrid/kgrid-instances/master/pwd/docker-compose.yml)

## Integration (Chipmunk)
[Chipmunk](https://github.com/kgrid/kgrid.github.io/wiki/integration) is a [heroku](https://dashboard.heroku.com) instance.

## Production (Lion)
[Lion](https://github.com/kgrid/kgrid.github.io/wiki/sandbox) is a docker instance create via docker compose.  
The [lion docker compose file](https://github.com/kgrid/kgrid-instances/blob/master/lion/docker-compose.yml) 
creates activator and library service both using file based shelf.

## Deploy an Instance
1. Using Release CLI create a release which will create and push new images for [activator](http://kgrid.org/kgrid-activator/docker/) and/or 
[library](http://kgrid.org/kgrid-library/docker/) as needed. 
1. Update the docker compose file for the instance (lion) based on the new images and commit those changes
1. Access [kgrid server](./kgrid-test)
1. Navagate to the kgrid-instances _/usr/local/miserver/kgrid/kgrid-instances_ directory and run ```git pull``` to update the docker compose file
1. From the instance directory run ```docker-compose up -d```

## Updating a Shelf
There are some scripts in place that will update the shelfs on each instance.
1. [chipmunck](chipmunk/shelfupdate.sh)
1. [lion](./lion/shelfupdate.sh)

The [create_shelf](./create_shelf.sh)script that will get latest released _cpic-collection_ or tagged release _labwise:1.0.0_ 
assets from git hub and create an shelf import manifest and then call the shelf endpoint with that manifest.

The following would load the lion library with released KOs
```
 ./create_shelf.sh \
   "http://lion-activator.kgrid.org http://lion-library.kgrid.org/shelf" \
   "opioid-collection cpic-collection \
   example-collection:1.1.0 cancer-risk-collection:1.1.0 \
   icon-array:1.0.0 script-numerate:0.3 postpci:1.0.0 labwise:1.0.0"
```

## Acceptance Testing
There is a simple Postman Acceptance Testing collection in the accpetance_test directory.  Using newman we can run 
the collection passing in correct environment chipmunk, lion 

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



### Troubleshooting

If ITS instances are down:

1. Log in to the ITS server (details in the kgrid-config repo)
2. Check if docker is running
3. Restart docker if necessary
4. In each instance folder run ```docker-compose up -d```
5. Update shelf if necessary by running the shelf loading script



