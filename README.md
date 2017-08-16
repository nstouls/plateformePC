# plateformePC

This version of the tool is modified to be installed on a RaspberryPI 2.


## Installation

* Install Debian, Docker, MongoDB and OpenJDK
 * curl -sSL https://get.docker.com/ | sh
 * sudo usermod -aG docker pi
 * sudo apt-get install openjdk-8-jdk git
 * sudo apt-get upgrade
 * docker pull descol/rpi-mongo

* Configure classpath :
 * echo "export JAVA_HOME=/usr/lib/jvm/default-java/" >> ~/.bashrc

* Deploy this tool:
 * Clone this git
 * cd base-plateforme
 * docker build -t descol/base-plateforme .


## Starting platform

Running mongoDB :
* Run a mongoDB instance:

 * docker run -d --name plateformeDB -v /home/pi/plateformePC/DB:/data/db -p 27017:27017 descol/rpi-mongo

 * docker start plateformeDB

 * sudo java -jar Plateforme-fat.jar

If Plateforme-fat.jar doesnt exist, it could be generated from the gradle script on a desktop computer :  

* ./gradlew build


## Background Running

* Install screen utility :
 * sudo apt-get update
 * sudo apt-get install screen

* Launch the platform through screen :
 * screen sudo java -jar Plateforme-fat.jar
