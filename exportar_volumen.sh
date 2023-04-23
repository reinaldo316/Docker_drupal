#!/bin/bash

echo "Ingrese el nombre del volumen que desea exportar:"
read volume_name

if ! docker volume ls -q | grep -q "^${volume_name}$"; then
  echo "El volumen '${volume_name}' no existe."
  exit 1
fi

echo "Ingrese la ruta completa del archivo de salida:"
read output_path

docker run --rm -v "${volume_name}:/volume" -v "${output_path}:/backup" alpine \
  tar -czvf "/backup/${volume_name}.tar.gz" -C /volume .
