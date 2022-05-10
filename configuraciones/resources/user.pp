user { 'nombre del usuario':
    ensure => present, # absent
    uid => 'id numerico del usuario',
    gid => 'id numerico del grupo primario del usuario',
    #groups => 'otros grupos a los que se debe asignar el usuario', # imperativo
    groups => 'otros grupos en los que el usuario debe estar asignado el usuario', # declarativo
    
    # Alternativos u opcionales
    home => 'carpeta personalizada del usuario',
    shell => 'shell por defecto para el usuario',
}


#sh < POSIX
#bsh > bash < gnu
#fish
#zsh

group { 'nombre del grupo':
    ensure => present, # absent
    gid => 'id numerico del grupo ',

    members => 'usuarios que quiero que estén en el grupo',
    
}