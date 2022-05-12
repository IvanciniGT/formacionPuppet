# Este módilo debe funcionar tanto en:
# - Ubuntu/Debian
# - Redhat y derivados

# Para validar todo el módulo podemos ejecutar:
# $ puppet parser validate init.pp params.pp virtualhost.pp

class apache (                  # Valores por defecto
    $paqueteapache            = $::apache::params::paqueteapache,
    $rutaficheroconfiguracion = $::apache::params::rutaficheroconfiguracion,
)
    inherits ::apache::params
{

    package { 'apache':
        name   => $paqueteapache,
        ensure => present,
    }
    
    file { 'fichero-configuracion' :
        ensure   =>  file, 
        path     =>  $rutaficheroconfiguracion, 
        source   =>  $originalficheroconfiguracion,
    }
    
    service { 'servicio-apache' :
        name      =>  $paqueteapache,
        ensure    =>  true, 
        enable    =>  true, 
        subscribe =>  File['fichero-configuracion'],
    }
}

#
# apache : Servidor web
#
# Ruta en nuestra computadora (Servidor)
# 
# Virtual Host
# /var/web1/ < app1.miservidor.com Entrada en un DNS apuntando a la IP de nuestro servidor
# /var/web2/ < app2.miservidor.com Otra entrada en un DNS apuntando a la misma IP de nuestro servidor
#
# /var/web/
#          index.html
#          imagenes/imagen1.png
#          php
#         
# http://app1.miservidor.com:80/index.html
# http://ip|nombre:80/imagenes/imagen1.png
#