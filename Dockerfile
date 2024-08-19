# Usa la imagen oficial de OpenJDK 17
FROM openjdk:17-jdk-alpine

# Configura el directorio de trabajo
WORKDIR /app

# Copia el archivo JAR generado en el contenedor
COPY target/apirest-0.0.1-SNAPSHOT.jar /app/apirest-0.0.1-SNAPSHOT.jar

# Exponer el puerto en el que corre tu aplicación (por defecto 8080)
EXPOSE 8080

# Comando para ejecutar la aplicación
ENTRYPOINT ["java", "-jar", "/app/apirest-0.0.1-SNAPSHOT.jar"]