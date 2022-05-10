# File nos sirve para ficheros y para directorios

file { '/etc/miapp/subfolder/suoders':
    # Esta palabra me habla del estado del recurso
    ensure        => file  , # directory | symlink | absent | present
    user          => 'root',
    group         => 'root',
    mode          => '0750', # Permisos
        # Segundo numero son los permisos del propietario : USER
        # Tercer  numero son los permisos del grupo.      : GROUP
        # Cuarto  numero son los permisos del rwsto de usuarios del SO
        # 4 - Lectura
        # 2 - Escritura
        # 1 - Ejecución
    source        => 'ruta al archivo en el servidor de puppet',
    # Puede ser relativa o absoluta. 
    # Si es relativa se refiera al directorio donde está este fichero que estamos editando
    
    # Otras propiedades
    content      => 'TEXTO',  # Esta propiedad NO LA USO si estoy usando la propiedad source
                         # Con ella damos el contenido del archivo como texto
    replace      => true,     # false
    
    # Directorios
    recurse      => true,     # false
                         # Me habla de la estructura de directorios, si debe crearse entera o no
    recurselimit => 2    # Limito a cuantas carpetas se puede trabajar la recursividad (creación, borrado)
    
    # Enlaces simbólicos   
    target       => 'ruta de destino del enlace simbolico',
}
