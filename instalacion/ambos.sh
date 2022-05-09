# Toda la guía de instalación: 
# https://puppet.com/docs/puppet/6/install_puppet.html

# Alta de repo y actualizar paquetes del repo
wget https://apt.puppetlabs.com/puppet6-release-bionic.deb
sudo dpkg -i puppet6-release-bionic.deb

# Contactamos por primera vez con el repo, para conocer que paquetes pueden instalarse desde él:
# - puppetserver
# - puppet-agent
sudo apt-get update
