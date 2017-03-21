# plateformePC

This version of the tool is modified to be installed on a RaspberryPI 2.


# Installation
 
Installing Debian and OpenJDK :
  cd base-plateforme
  docker build -t alexandreinsa/base-plateforme .

Installing mongoDB : 
  docker build -t descol/rpi-mongo .

# Starting platforme

Running mongoDB :
    docker run -d --name plateformeDB -v /home/pi/plateformePC/DB:/data/db -p 27017:27017 descol/rpi-mongo
  ou 
    docker run -d --name plateformeDB -v /home/pi/plateformePC/DB:/data/db -p 27017:27017 mangoraft/mongodb-arm
  docker start plateformeDB
  --- sudo ./gradlew runShadow
  sudo java -jar Plateforme-fat.jar 

