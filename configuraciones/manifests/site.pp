
node default {

    $nombredelservidor = 'curso'
    $correoadministradorsitio = 'micorreo@miempresa.es'

    include apache
    include apache::virtualhost

}