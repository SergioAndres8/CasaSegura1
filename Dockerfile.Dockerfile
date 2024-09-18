# Usar una imagen de Tomcat
FROM tomcat:9.0-jdk11

# Copiar el contenido del proyecto al directorio webapps de Tomcat
COPY . /usr/local/tomcat/webapps/ROOT/

# Exponer el puerto por el que escuchará Tomcat (por defecto 8080)
EXPOSE 8080

# Definir el comando para iniciar Tomcat
CMD ["catalina.sh", "run"]
