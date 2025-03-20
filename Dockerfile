FROM debian:latest

# Instalar dependencias y actualizar
RUN apt-get update && apt-get install -y curl sudo

# Instalar PufferPanel
RUN curl -fsSL https://download.pufferpanel.com/install.sh | bash

# Exponer el puerto 8080 para la interfaz web
EXPOSE 8080

# Agregar script de inicio para crear el usuario
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Ejecutar el script al iniciar el contenedor
CMD ["/entrypoint.sh"]
