* Copy the certificate file to `JAVA_HOME/jre/lib/security` folder
* Go to the folder 
* Import the cert to java with the command
`sudo keytool -import -alias <the short name of the server> -file <cert_file_name_you_exported.crt> -keystore cacerts -storepass changeit`

