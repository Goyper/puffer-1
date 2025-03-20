#!/bin/bash

# Iniciar PufferPanel en segundo plano
pufferpanel run &

# Esperar a que PufferPanel inicie
sleep 5

# Crear el usuario con las credenciales establecidas
pufferpanel user add --email renderpufferpanel@gmail.com --name renderpufferpanel --password renderpufferpanel12345 --admin

# Mantener el contenedor en ejecución
wait
