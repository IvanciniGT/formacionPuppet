# Instalamos el agente de puppet
sudo su - # Esto nos poner como usuario root !
apt-get install puppet-agent -y

# Comprobamos instalación:
puppet --version

# Necesitamos dar de alta en la variable de entorno PATH la ruta donde están los binarios de puppet
echo "export PATH=\$PATH:/opt/puppetlabs/bin" >> ~/.bashrc
source ~/.bashrc

# Comprobamos instalación:
puppet --version

# Arrancamos el agente de puppet

#systemctl start puppet
#systemctl enable puppet

puppet resource service puppet ensure=running enable=true
                               # Configuraciones específicas para este tipo de recurso
                        # Nombre del servicio: puppet
                # Tipo de recurso que quiero: Un servicio
       # Quiero declarar un recurso que debe quedar en la máquina configurado

#systemctl status puppet
puppet resource service puppet

# Puppet, cómo está el recurso de tipo servicio que se llama "puppet"?

# Fichero de manifiesto de puppet:
# service { 'puppet':
#   ensure     => running,
#   enable     => true,
# }

# Configurar quién es el servidor
## Opción cutre, que te cagas... pero rápida y simple
echo "172.31.12.98 puppet" >> /etc/hosts

## Mañana la guya que es cambiar el fichero de configuración de puppet-agent

# Necesito un reinicio del servicio para aplciar la nueva configuración:
systemctl restart puppet


# Generar el certificado del nodo administrado para puppet
puppet ssl bootstrap