package { 'nginx':
    ensure      => present, # absent | <version> | latest | purged
    provider    => apt , # Habitualmente no es necesario
                         # Listado completo de providers: 
                         # https://puppet.com/docs/puppet/6/types/package.html
    #source      => 'ruta donde se encuentra el instalador'
    
}