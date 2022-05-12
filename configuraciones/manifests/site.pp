
node default {

    # Esto es una mala práctica
    # No tengo control de estas variables: NO TENGO ENCAPSULACION
    $nombredelservidor = 'curso' # Me lo llevo a hiera...
    # Asi puedo tener un nombre distinto para cada nodo
    $correoadministradorsitio = 'micorreo@miempresa.es'

    include apache
    include apache::virtualhost

    #mysql
    # base de datos

    # Para una instalación básica:
    include mysql::server
    
    # Esto SI ES UNA BUENA PORACTICA para inyectar valores a una clase / modulo
    # OJO, esto requiere que el módulo haya definido esas variables en la calse,
    # Como nosotros hemos hecho en el fichero init.pp...
    # Y como no hemos hecho en el fichero visrtualhost, que es una RUINA !!!!
    #class { 'mysql::server':
    #  #root_password           => 'strongpassword',
    #  remove_default_accounts => true,
    #  restart                 => true,
    #}
    
    mysql::db { 'cursoDB':
      user     => 'usuario',
      password => 'password',
      host     => 'localhost',
      grant    => ['SELECT', 'UPDATE'],
    }
    
}