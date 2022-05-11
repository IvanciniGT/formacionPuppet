# Trabajando con módulos:
# Buscar el módulo adecuado en puppet forge... y configurarlo aquí según la documentación

node default {

    class { 'ntp':
      servers         => [ 'ntp1.corp.com', 'ntp2.corp.com' ],
    }

}
