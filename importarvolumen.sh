#!/bin/bash


echo "Importar volumen"
read -p "Ingrese el nombre del volumen a importar: " volume_name
if ! docker volume inspect $volume_name &> /dev/null; then
  echo "ERROR: El volumen $volume_name no existe."
  exit 1
fi

read -p "El volumen $volume_name ya existe. ¿Desea reemplazarlo? (S/N): " replace
if [ "$replace" == "S" ] || [ "$replace" == "s" ]; then
  echo "Eliminando volumen existente $volume_name..."
  docker volume rm $volume_name
else
  echo "Saliendo sin importar el volumen $volume_name."
  exit 0
fi

echo "Importando volumen $volume_name desde el archivo .tar"
read -p "Ingrese la ruta completa del archivo .tar: " tar_file
if [ ! -f $tar_file ]; then
  echo "ERROR: El archivo $tar_file no existe."
  exit 1
fi

docker volume create $volume_name
docker run --rm -v $volume_name:/volume -v $(dirname $tar_file):/backup -w /volume alpine tar xvf /backup/$(basename $tar_file)
