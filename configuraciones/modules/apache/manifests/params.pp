class apache::params {
    
    if $::osfamily == "RedHat" {

        $paqueteapache = "httpd"   # Redhat y derivados
        $rutaficheroconfiguracion = '/etc/httpd/conf/httpd.conf'
        $originalficheroconfiguracion = 'puppet:///modules/apache/files/httpd.conf'
                                         # En la carpeta raiz de puppet... donde sea que hayan instalado puppet
    } elsif $::osfamily == "Debian" {

        $paqueteapache = "apache2" # Ubuntu/Debian
        $rutaficheroconfiguracion = '/etc/apache2/apache2.conf'
        $originalficheroconfiguracion = 'puppet:///modules/apache/files/httpd.conf'

    } else{
        # Si estamos con otro SO, no sigas, corta la ejecución... y dame un mensajito para que me entere
        fail("Este sistema operativo no está soportado: $::osfamily")
    }

    
}