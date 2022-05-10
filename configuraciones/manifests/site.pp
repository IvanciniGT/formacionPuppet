
node default {

    # Esto no está recomendado ni por la gente de puppet... 
    # Es heredado de versiones antiguas
    # Package['nginx'] -> Service['nginx']    # Da una relación de orden
    # Package['nginx'] ~> Service['nginx']    # Esto equivale al notify/subscribe en cunto a funcionalidad
    # En esta sintaxis antigua, se pueden encadenar muchos recursos
    # Package['nginx'] -> File['/etc/nginx/nginx.conf'] ~> Service['nginx']
    
    package { 'nginx':
        ensure      => latest,
        #before      => Service['nginx'], # Quiero que esto (paquete) esté listo antes de procesar el servicio
        #notify      => Service['nginx'], # Quiero que esto (paquete) esté listo antes de 
                                          # procesar el servicio, pero además,
                                          # Si este recurso provoca un cambio en el sistema
                                          # quiero que se refresque (refresh) el servicio
    }    

    service { 'nginx':
        ensure   =>  running, 
        enable   =>  true, 
        #require  =>  Package['nginx'], # Quiero que este servicio, se cargue despues del paquete
        #subscribe =>  Package['nginx'], # Quiero que este servicio, se cargue despues del paquete
                                          # Si el paquete ha provocado un cambio
                                          # quiero que se refresque (refresh) el servicio
    }
    
    # Sintaxis para crear relaciones de dependencia
    # Cualquier resource, puede tener, adicionalmente, las siguientes propiedades genéricas
    #  before - require
    #  notify - subscribe
}
