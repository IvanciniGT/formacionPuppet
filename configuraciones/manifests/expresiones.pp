$servicio = "apache2"
$puerto  = 80
$modulos = [ "modulo1", "modulo2" ]
$paquetes = { "apache" => 80 , "nginx" => 443 }  # Diccionario, array asociativo, Mapa: Hash
$activado = true
$motor_bbdd = "mysql"
# Una expresión es un valor que calculo en tiempo de ejecución

# Expresiones relacionales:

    # Devuelve un valor lógico: True | False
    #   == != < <= > >= =~ !~ 
    #   in
    #       "sql" in $motor_bbdd   => true
    #           Equivalente a : $motor_bbdd =~ "sql"   => true
    #       "modulo1" in $modulos  => true
    #       "apache" in $paquetes  => true

# Operadores lógicos:

    #   Son similares a los operadores relaciones en que también devuelven un valor lógico.
    #   Su(s) argumento(s) - lo que va alrededor del operador -  también son valores lógicos
    #       and
    #       or      $puerto > 80 or $puerto < 25
    #       !       !("apache" in $paquetes)    => false       
$arranco = !("apache" in $paquetes) 


# Operadores aritméticos:
    #   + - / * %

# Operadores para arrays
$puertos = [ 80 ]
$puerto_seguro = true
if $puerto_seguro {
    #$puertos = $puertos + [443, 8443]
    $puertos = $puertos + 443
}

$puertos = [ 80, 443 ]
$puerto_seguro = false
if !$puerto_seguro {
    $puertos = $puertos - 443
}


node default {

    service { $servicio :
        ensure   =>  $arranco, 
        enable   =>  $activado, 
    }

}

