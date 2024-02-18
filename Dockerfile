# Usa la imagen base de Kali Linux
FROM kalilinux/kali-rolling

# Actualiza los paquetes e instala John the Ripper
RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y john

# Otros comandos para configurar tu entorno pueden ir aquí

# El comando por defecto a ejecutar cuando se inicie el contenedor
CMD ["tail", "-f", "/dev/null"]
