$paquetes = [ "nginx", "apache2" ]

node default {

    package { $paquetes:
        ensure   => latest,
    }    

    service { $paquetes:
        ensure   =>  false, 
        enable   =>  true, 
    }
}
