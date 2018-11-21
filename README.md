# plateformePC

This version of the tool is modified to be installed on a RaspberryPI 2.


## Installation

* Install Debian, Docker, MongoDB and OpenJDK
```bash
    curl -sSL https://get.docker.com/ | sh
    sudo usermod -aG docker pi
    sudo apt-get install openjdk-8-jdk git
    sudo apt-get upgrade
    docker pull descol/rpi-mongo
```


* Configure classpath :
```bash
    echo "export JAVA_HOME=/usr/lib/jvm/default-java/" >> ~/.bashrc
```

* Deploy this tool:
```bash
    Clone this git
    cd base-plateforme
    docker build -t descol/base-plateforme .
```


## Starting platform

Running mongoDB and Vertex-based web server:
```bash
    docker run -d --name plateformeDB -v /home/pi/plateformePC/DB:/data/db -p 27017:27017 descol/rpi-mongo
    docker start plateformeDB
    sudo java -jar build/libs/Plateforme-fat.jar
```

If Plateforme-fat.jar doesnt exist, it could be generated from the gradle script on a desktop computer :  
```bash
    ./gradlew shadowJar
```


## Background Running

### Manual method
* Install screen utility :
```bash
    sudo apt-get update
    sudo apt-get install screen
```

* Launch the platform through screen :
```bash
    screen sudo java -jar build/libs/Plateforme-fat.jar
```

### Automatic launch at startup 
Add a link in systemd pointing out to the rpi-platefromePC service:
```bash
    sudo ln -s /home/pi/plateformePC/scripts/rpi-plateformePC.service /etc/systemd/system/rpi-plateformePC.service 
```

## Troubleshooting

* To revert MongoDB from a crash :

```bash
    docker run --rm --volumes-from plateformeDB descol/rpi-mongo unlink "/mongodb/data/mongod.lock"
    docker run --rm -it -p 27017:27017  --volumes-from plateformeDB descol/rpi-mongo mongod --dbpath /mongodb/data/ --repair
    docker start plateformeDB
```
