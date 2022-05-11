$servicio = "apache2"
$puerto  = 80

# CONDICIONAL BASADO EN IF
node default {

#    if CONDICION {
# CONDICION = Es una expresión que debe devolver un valor lógico True , False 
# Habitualmente esas expresiones las montamos basadas en variables y usando operadores relaciones
# Operadores relaciones: 
#   ==          $puerto == 80
#   !=          $puerto != 80
#   >
#   >=
#   <
#   <=
# Operadores de expresiones regulares
#   =~  Match , se sigue un patrón.              $servicio =~ "(apache[2]?)|(httpd)"
#   !~  No match, no se sigue un patrón          $servicio !~ "(apache[2]?)|(httpd)"
    if $puerto == 80 {
        service { $servicio :
            ensure   =>  false, 
            enable   =>  true, 
        }
    }elsif $puerto == 90 {
        service { $servicio :
            ensure   =>  false, 
            enable   =>  false, 
        }
    }else{
        service { $servicio :
            ensure   =>  true, 
            enable   =>  true, 
        }
    }
}

# CONDICIONAL BASADO EN UNLESS
node 'nodo1.produccion.es' {
    
    unless $puerto == 80 {
        service { $servicio :
            ensure   =>  false, 
            enable   =>  true, 
        }
    }else{
        service { $servicio :
            ensure   =>  true, 
            enable   =>  true, 
        }
    }

}


# CONDICIONAL BASADO EN CASE
node 'nodo2.produccion.es' {
    
    case $servicio {
        
        'apache2': {    
            service { $servicio :
                ensure   =>  false, 
                enable   =>  true, 
            }
        }   
        /^dockerv[0-9.]+$/: {    
            service { $servicio :
                ensure   =>  true, 
                enable   =>  true, 
            }
        }   
        default : {    
            service { $servicio :
                ensure   =>  false, 
                enable   =>  false, 
            }
        }   
        
    }

}

# Valor de una variable basado en una condicion
node 'nodo3.produccion.es' {
    
    $puerto = $servicio ? {
        'apache2' => 80,
        'nginx' => 443,
        /(mysql)|(mariadb)/ => 3306,
        default => 0 ,
    }
    
}