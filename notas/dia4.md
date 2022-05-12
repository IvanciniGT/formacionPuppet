# Creacion de módulos

Cuando creamos un módulo, tengo que estar cambiando entre 2 gorros, 2 roles:
- Desarrolla el módulo -> Yo doy valores por defecto para las configuraciones que me interese.
- Usa el módulo
- 



cp -r /home/ubuntu/environment/ivan/configuraciones/modules/apache /etc/puppetlabs/code/environments/production/modules/
cp /home/ubuntu/environment/ivan/configuraciones/manifests/site.pp /etc/puppetlabs/code/environments/production/manifests
cd /etc/puppetlabs/code/environments/production/manifests
puppet apply --noop site.pp
