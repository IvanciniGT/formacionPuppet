class apache::virtualhost {
    
    if $::osfamily == "RedHat" {

        file { 'fichero-configuracion-redhat' :
            ensure   =>  file, 
            path     =>  '/etc/httpd/conf/vhost.conf', 
            content  =>  template('puppet:///modules/apache/templates/redhat.erb'),
        }
                                         # En la carpeta raiz de puppet... donde sea que hayan instalado puppet
    } elsif $::osfamily == "Debian" {

        file { 'fichero-configuracion-debian' :
            ensure   =>  file, 
            path     =>  "/etc/apache2/sites-available/$nombredelservidor.conf", # TODO:Convertir nombre de fichero a variable
            content  =>  template('puppet:///modules/apache/templates/debian.conf.erb'),
        }

        file { 'enlace-configuracion-debian' :
            ensure   =>  symlink, 
            path     =>  "/etc/apache2/sites-enabled/$nombredelservidor.conf", # TODO:Convertir nombre de fichero a variable
            target   =>  "/etc/apache2/sites-available/$nombredelservidor.conf",
        }

        file { [ "/var/www/html/$nombredelservidor/web", "/var/www/html/$nombredelservidor/logs"] :
            ensure   =>  directory, 
        }

    } else{
        # Si estamos con otro SO, no sigas, corta la ejecución... y dame un mensajito para que me entere
        fail("Este sistema operativo no está soportado: $::osfamily")
    }

    
}