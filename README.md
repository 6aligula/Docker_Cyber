Contenedor Docker Kali con John the Ripper
Este proyecto facilita el despliegue de un contenedor Docker basado en Kali Linux con John the Ripper preinstalado. Ideal para entornos de pruebas de penetración y análisis de seguridad.

Requisitos Previos
Docker
Docker Compose
Asegúrate de tener Docker y Docker Compose instalados en tu sistema antes de continuar.

Construcción de la Imagen
Crear un Dockerfile

Crea un archivo Dockerfile en el directorio raíz del proyecto con el siguiente contenido:

Dockerfile

# Usa la imagen base de Kali Linux
FROM kalilinux/kali-rolling

# Actualiza los paquetes e instala John the Ripper
RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y john

# El comando por defecto a ejecutar cuando se inicie el contenedor
CMD ["tail", "-f", "/dev/null"]
Este Dockerfile instala John the Ripper en una imagen de Kali Linux.

Construir la Imagen

Ejecuta el siguiente comando en el directorio donde se encuentra tu Dockerfile para construir tu imagen Docker personalizada:


docker build -t kali_con_john .
Esto creará una imagen llamada kali_con_john con John the Ripper ya instalado.

Uso con Docker Compose
Crear un archivo docker-compose.yml

Define tu servicio en un archivo docker-compose.yml usando la imagen personalizada:

yaml
version: '3.8'

services:
  kali:
    image: kali_con_john
    container_name: kali_john
    volumes:
      - ./data:/data
    tty: true
Este archivo configura un contenedor llamado kali_john que monta un volumen local ./data para persistencia de datos.

Iniciar el Contenedor

Usa Docker Compose para iniciar tu contenedor:


docker-compose up -d
Esto levantará el contenedor en modo "detached", corriendo en el fondo.

Acceso al Contenedor
Para acceder al shell del contenedor, ejecuta:

docker exec -it kali_john bash
Ahora estarás dentro del contenedor, con John the Ripper listo para ser usado.

Mantenimiento
Detener el Contenedor: docker-compose down
Reconstruir la Imagen: Si modificas el Dockerfile, recuerda reconstruir tu imagen con docker build -t kali_con_john . y luego levantar el contenedor de nuevo con docker-compose up -d.

By GPT El diablo