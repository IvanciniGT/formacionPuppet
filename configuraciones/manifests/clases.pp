node /apache.produccion/ {
    include apache
}

node /apache.test/ {
    $activado  = false
    $arrancado = false
    $fichero_configuracion = 'configuraciones/apache2.test.conf'
    include apache
}
node /apache.desarrollo/ {
    $fichero_configuracion = 'configuraciones/apache2.desa.conf'
    include apache
}

# Las clases son parametrizables. UOOOOO !!!!
class apache (
    String $paquete   = 'apache2'
    Boolean $activado  = true
    Boolean $arrancado = true
    String $version   = 'latest'
    String $ruta      = '/etc/apache2/apache2.conf'
    String $propietario = "root"
    String $fichero_configuracion = 'configuraciones/apache2.conf'
    # Integer
    # Float
    # Hash
    # Array
) {

    package { $paquete :
        ensure   =>  $version, 
    }
    file { $ruta :
        ensure   =>  $arrancado, 
        owner    =>  $propietario, 
        source   =>  $fichero_configuracion, # TODO: Cambiar a content
    }
    service { $paquete :
        ensure    =>  $arrancado, 
        enable    =>  $activado, 
        subscribe => File[$ruta],
    }
    
}