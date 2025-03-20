# Usar Debian como base
FROM debian:latest

# Actualizar el sistema y descargar dependencias
RUN apt-get update && apt-get install -y curl sudo

# Instalar PufferPanel
RUN curl -s https://packagecloud.io/install/repositories/pufferpanel/pufferpanel/script.deb.sh | bash && \
    apt-get install -y pufferpanel

# Hacer que PufferPanel se inicie automáticamente
RUN pufferpanel install

# Exponer el puerto 8080 para la interfaz web
EXPOSE 8080

# Comando para iniciar PufferPanel y crear el usuario automáticamente
CMD pufferpanel run & \
    sleep 5 && \
    pufferpanel user add --email renderpufferpanel@gmail.com --name renderpufferpanel --password renderpufferpanel12345 --admin && \
    wait
