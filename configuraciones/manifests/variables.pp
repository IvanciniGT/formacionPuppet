# Variables globales: Estas variables aplican sobre todos los nodos
$servicio = "apache2"
$puerto  = 80
$modulos = [ "modulo1", "modulo2" ]
$activado = true

# Los nombres de variables pueden contener:
# - Letras mayúsculas y minúsculas
# - Números
# - Guiones bajos
# Pero deben comenzar por una letra

node default {

    service { $servicio :
        ensure   =>  false, 
        enable   =>  $activado, 
        status   => "[[ $( ps -eaf | grep -c ${servicio} ) > 1 ]] && return 0 || return 1",
    }

}

node 'nodo1.produccion.es' {
    
    $activado = false

    service { $servicio :
        ensure   =>  false, 
        enable   =>  $activado, 
    }

}


## Acceder a los facts de un nodo

### Hay 2 formas de acceder a los facts

# A traves de su nombre: Son los nombre de primer nivel de la salida del facter
# $path
# $os

# Como alternativa Y MEJOR ALTERNATIVA
# $facts['os']['family']  => 'Debian'

if $facts['os']['family']  == 'Debian' {
    # hago algo    
}

$id_del_usuario = $facts['identity']['uid']

