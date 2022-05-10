# Lo habitual para gestionar un servicio
service { 'nombre-del-servicio':
    ensure   =>  true, # running | stop | false
    enable   =>  true, # false
}


# Ocasionalmente puede ser que queramos crear el servicio
# En este escenario, lo normal será usar un fichero... 
# Ya que admite muchas más opciones de personalización

# unit files de systemd < .service

service { 'mi-servicio':
    ensure     =>  true, # running | stop | false
    enable     =>  true, # false
    provider   => 'systemd', # Quien gestiona el servicio
    # Lista completa: https://puppet.com/docs/puppet/6/types/service.html#service-attribute-provider
    start      => 'comando de arranque del servicio',
    stop       => 'comando de detención del servicio',
    restart    => 'comando de reinicio del servicio',
    status     => 'comando de estado del servicio',
}