# Etapa de construcción
FROM maven:3.8.4-openjdk-17 AS builder

# Configura el directorio de trabajo
WORKDIR /app

# Copia el archivo pom.xml y el directorio src
COPY pom.xml ./
COPY src ./src

# Descarga las dependencias y construye el archivo JAR
RUN mvn clean package -DskipTests

# Etapa de ejecución
FROM openjdk:17-jre-slim

# Configura el directorio de trabajo
WORKDIR /app

# Copia el archivo JAR del contenedor de construcción al contenedor final
COPY --from=builder /app/target/*.jar /app/app.jar

# Exponer el puerto en el que la aplicación se ejecutará
EXPOSE 8080

# Comando para ejecutar la aplicación
ENTRYPOINT ["java", "-jar", "/app/app.jar"]