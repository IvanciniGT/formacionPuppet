# Instalamos el servidor de puppet
sudo su - # Esto nos poner como usuario root !
apt-get install puppetserver -y

# Comprobamos instalación:
puppetserver --version # cli

# Necesitamos dar de alta en la variable de entorno PATH la ruta donde están los binarios de puppet
echo "export PATH=\$PATH:/opt/puppetlabs/bin" >> ~/.bashrc
cat ~/.bashrc


# Mirar que el servidor de puppet esté operativo

systemctl start puppetserver
systemctl enable puppetserver
systemctl status puppetserver


# Configurar quién es el servidor para ser llamado desde el comando puppetserver
## Opción cutre, que te cagas... pero rápida y simple
echo "172.31.12.98 puppet" >> /etc/hosts

## Mañana la guya que es cambiar el fichero de configuración de puppet-agent

puppetserver ca list
puppetserver ca sign ip-172-31-5-77.eu-west-1.compute.internal
puppetserver ca sign --all