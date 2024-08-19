# Usar una imagen base de OpenJDK 17
FROM openjdk:17-jdk AS builder

# Crear un directorio de trabajo en el contenedor
WORKDIR /app

# Copiar el archivo pom.xml y el directorio src
COPY pom.xml ./
COPY src ./src

# Descargar las dependencias y construir el archivo JAR
RUN ./mvnw dependency:go-offline -B
RUN ./mvnw package -DskipTests

# Usar una imagen base de OpenJDK 17 más ligera para ejecutar la aplicación
FROM openjdk:17-jre

# Crear un directorio de trabajo en el contenedor
WORKDIR /app

# Copiar el archivo JAR del contenedor de construcción al contenedor final
COPY --from=builder /app/target/*.jar /app/app.jar

# Exponer el puerto en el que la aplicación Spring Boot se ejecutará
EXPOSE 8080

# Establecer el comando para ejecutar la aplicación
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
