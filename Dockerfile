# Usa la imagen oficial de OpenJDK 17
FROM openjdk:17-jdk-alpine

# Configura el directorio de trabajo
WORKDIR /app

# Copia el archivo JAR generado en el contenedor
COPY target/apirest.jar /app/apirest.jar

# Establecer la variable de entorno del puerto
ARG PORT=8080
ENV PORT=${PORT}

# Exponer el puerto por defecto
EXPOSE ${PORT}

# Comando para ejecutar la aplicación
ENTRYPOINT ["java", "-jar", "/app/apirest.jar"]