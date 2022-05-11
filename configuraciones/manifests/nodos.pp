
#
# Un manifiesto es un archivo que define los recursos que quiero o no (el estado)
# para un determinado entorno o conjunto de entornos.

node ESPECIFICACION_DE_NODO {
    # Recursos que quiero para ese nodo o conjunto de nodos
    # Esos recursos:
        # Podrían usar datos, que yo cargaría en variables...
        # Aquí definiré variables si las necesito
    # Además, puede haber relaciones de dependencia entre los recursos
}

# ESPECIFICACION_DE_NODO
# Describe un nombre / nombres o patrón que debe seguir un nombre de un nodo, 
# para que sea elegible / susceptible de tener la configuración que estamos definiendo
# Puedo usar:
#    default        pa to el mundo
#    'nombre'       por ejemplo 'ip-172-31-12-98.eu-west-1.compute.internal'
#    'nombre1', 'nombre2'       por ejemplo:
#       'ip-172-31-12-98.eu-west-1.compute.internal, ip-172-31-12-99.eu-west-1.compute.internal'
#    /REGEX/      Por ejemplo: /^mysql[0-9]+[.]produccion[.]miempresa[.]es$/

# ESTO SE USA MUCHISISISIMO EN PUPPET.
# Cuando vayais a usar expresiones regulares, acceder a: regex101.com

# La sintaxis que usamos en REGEX viene del lenguaje PERL