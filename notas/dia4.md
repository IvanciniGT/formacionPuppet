# Creacion de módulos

Cuando creamos un módulo, tengo que estar cambiando entre 2 gorros, 2 roles:
- Desarrolla el módulo -> Yo doy valores por defecto para las configuraciones que me interese.
- Usa el módulo
- 



cp -r /home/ubuntu/environment/ivan/configuraciones/modules/apache /etc/puppetlabs/code/environments/production/modules/
cp /home/ubuntu/environment/ivan/configuraciones/manifests/site.pp /etc/puppetlabs/code/environments/production/manifests
cd /etc/puppetlabs/code/environments/production/manifests
puppet apply --noop site.pp


puppet agent es el programa que se pone en contacto con el servidor
y le pide un catalogo y lo ejecuta, previo mandarle los facts

puppet apply... este programa nos permite ejecutar un catalogo directamente en local, sin pasar por servidor


En una instalacion real, instalamos r10k.

Esta herramienta requiere un fichero de configuracion: /etc/r10k.yaml 
:cachedir: '/var/cache/r10k' 
:sources: 
:opstree: 
remote: 'https://github.com/fullstack-puppet/fullstackpuppet-environment.git' 
basedir: '/etc/puppetlabs/code/environments' 


Una vez creado este fichero, ejecutamos:
$ r10k deploy environment -pv 

Esto sincroniza los ficheros de mi repo, con las carpetas adecuadas del servidor de puppet


Normalmente hacemos un cron, para que esto se actualice con una periodicidad X

cat << EOF > /etc/cron.d/r10k.conf 
SHELL = /bin/bash 
PATH = /sbin:/bin:/usr/sbin:/usr/bin 
H/15 * * * * root r10k deploy environment -p 
EOF
