# Usar una imagen base de OpenJDK 17
FROM openjdk:17-jdk AS build

# Crear un directorio de trabajo en el contenedor
COPY . /app
WORKDIR /app


# Descargar las dependencias y construir el archivo JAR
RUN chmod +x mvnw
RUN ./mvnw package -DskipTests
RUN mv -f target/*.jar appp.jar

# Usar una imagen base de OpenJDK 17 más ligera para ejecutar la aplicación
FROM openjdk:17-jre

# Exponer el puerto en el que la aplicación Spring Boot se ejecutará
ARG PORT
ENV PORT=${PORT}

# Copiar el archivo JAR del contenedor de construcción al contenedor final
COPY --from=build /app/app.jar .

RUN useradd runtime
USER runtime


# Establecer el comando para ejecutar la aplicación
ENTRYPOINT ["java", "-Dserver.port=${PORT}}", "-jar" , "app.jar"]
