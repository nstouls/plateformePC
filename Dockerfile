#import de l'image sur laquelle se baser
#FROM alexandreinsa/base-plateforme:latest
FROM descol/base-plateforme:latest
MAINTAINER Alexandre Claude <alexandre.claude@insa-lyon.fr>

#On s'attend a recevoir en parametre le nom du repertoire ou se trouve le driver de tests ainsi que la correction
ARG driver_dir
ADD $driver_dir /java/drivers

#Changement de repertoire de travail
WORKDIR /java
RUN mkdir build/


# ENTRYPOINT javac -encoding UTF-8 -cp ./ -d build/ */*.java && java "-Dfile.encoding=UTF-8" -cp build/ Driver_tests >> ./etudiant/driver_result.txt

ENTRYPOINT touch ./etudiant/compilation_result.txt ; \
           javac -encoding UTF-8 -cp ./ -d build/ */*.java  2>> ./etudiant/compilation_result.txt 1>>./etudiant/compilation_result.txt ; \
           if [ -s ./etudiant/compilation_result.txt ] ; then \
               echo "<p><b>Erreur de compilation</b></p><pre>"             >> ./etudiant/driver_result.txt ; \
               cat ./etudiant/compilation_result.txt                >> ./etudiant/driver_result.txt ; \
               echo "</pre>"                                        >> ./etudiant/driver_result.txt ; \
           else  \
               java "-Dfile.encoding=UTF-8" -cp build/ Driver_tests >> ./etudiant/driver_result.txt ;\
           fi 
