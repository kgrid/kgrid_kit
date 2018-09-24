FROM openjdk:8
MAINTAINER KGrid Team "kgrid-developers@umich.edu"

RUN sudo mkdir /var/kgrid \
 && sudo mkdir /var/kgrid/shelf \
 && cd /tmp \
 && curl -L -O "https://github.com/kgrid/kgrid-activator/releases/download/kgrid-activator-1.0.1/kgrid-activator-1.0.1.jar" \
 && curl -L -O "https://github.com/kgrid-objects/example-kos/releases/download/1.0.0/hello-world.zip" \
 && sudo chmod g-w /var/kgrid \
 && sudo cp *.jar /var/kgrid \
 && sudo unzip *.zip -d /var/kgrid/shelf

EXPOSE 8080
WORKDIR /var/kgrid
CMD  java -jar /var/kgrid/kgrid-activator*.jar --server.port=8080
