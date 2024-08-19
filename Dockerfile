# Usa la imagen base de OpenJDK 17
FROM openjdk:17-jdk-alpine

# Configura el directorio de trabajo
WORKDIR /app

# Copia el archivo JAR generado al contenedor
COPY target/jacs-crud.jar /app/jacs-crud.jar


EXPOSE 8080

# Comando para ejecutar la aplicación
ENTRYPOINT ["java", "-jar", "/app/jacs-crud.jar"]
