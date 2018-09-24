



docker build -t kgrid_activator . 
docker run -p 8080:8080 -v /Users/farrisg/shelf:/var/kgrid/shelf --name kgrid_activator -d  kgrid_activator 
docker stop kgrid_activator
docker start kgrid_activator
docker exec -it kgrid_activator bash