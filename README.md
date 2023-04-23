# Docker_drupal

Instalación de Drupal en contenedores con Docker Compose

Este archivo de Docker Compose contiene la configuración para ejecutar Drupal 8 con Apache y MySQL 8.0 en contenedores que incluyen volúmenes para persistir los datos de la bd y los archivos de configuración Drupal.

Componentes

El archivo de Docker Compose se compone de dos servicios :

drupalunir

Este servicio usa la imagen drupal:8-apache que es la versión 8 de Drupal junto con el servidor web Apache. Este servicio se daen el puerto 8080 del host y está configurado conectado al servicio de MySQL com el puerto 3306.

El servicio de Drupal utiliza estos volúmenes:

drupal-config: contiene los archivos de configuración de Drupal.
drupal-modules:contiene los módulos de Drupal.
drupal-profiles: contiene los perfiles de Drupal.
drupal-themes: contiene los temas de Drupal.
drupal-sites:contiene los sitios de Drupal.

El servicio de Drupal define cuatro variables de entorno para conectar al servicio de base de datos MySQL:

MYSQL_DATABASE: el nombre de la base de datos.
MYSQL_USER: el nombre de usuario.
MYSQL_PASSWORD: la contraseña del usuario.
MYSQL_HOST: el servicio de MySQL para conectar desde Drupal.

dbmysql

Este servicio usa la imagen mysql:8.0 . Este servicio se da en el puerto 3306 del host.

El servicio de MySQL tiene un volumen llamado mysql-data que se utiliza para persistir los datos de la base.

El servicio de MySQL define cuatro variables de entorno que se utilizan para configurar la base de datos de MySQL:

MYSQL_DATABASE: el nombre de la base de datos.
MYSQL_USER: el nombre de usuario.
MYSQL_PASSWORD: la contraseña del usuario .
MYSQL_ROOT_PASSWORD: la contraseña de root de MySQL.

los dos servicios se defineun red del tipo internal tanto parael ervicio drupal unir y pra el servicio dbmysql.

Script para exportar de un volumen en Docker

Este es un script en Bash llamado exportar_volumen.sh que permite exportar un volumen de Docker en un archivo .tar.gz.

Para ejecutar el script se lo ejecuta con el siguiente comando:

bash exportar_volumen.sh 

inmediatamente pedira "Ingrese el nombre del volumen que desea exportar:"
una vez ingresado el script verificara su existencia y una ves confirmado pedira "Ingrese la ruta completa del archivo de salida:"
que seria la ruta donde se crear y guardara elarchivo .tar

Script para importar un volumen en Docker

Este es un script en Bash llamado importarvolumen.sh que permite importar un volumen de Docker en un archivo .tar.gz.

Para ejecutar el script se lo ejecuta con el siguiente comando:

bash importarvolumen.sh 

inmediatamente pedira "Ingrese el nombre del volumen que desea importar:"
una vez ingresado el script verificara su existencia y una ves confirmado preguntara si "El volumen $volume_name ya existe. ¿Desea reemplazarlo? (S/N): " si se escoje si imnediatamente el scrip preguntara "Ingrese la ruta completa del archivo .tar:"
que seria la ruta donde se creo y guardo el archivo .tar
