# Definición de estados de entornos

Los estados en los queremos dejar un entorno los vamos adefinir en un fichero denominado manifiesto

Un manifiesto en última instancia contiene recursos.

Los recursos son elementos de configuración de muy bajo nivel:
- Servicio
- Paquete
- Usuario
- Archivo

Pero al trabajar queremos hablar en un lenguaje de más alto nivel: módulos (en ansible es lo que llamamos un role).

En forge de puppet encontramos muchos módulos (+6000)

Un módulo nos permite definir un montón de recursos como un bloque único que yo puedo aplicar sobre un entorno.

Quiero un servidor web:
- instalar paquetes
- configurar cosas
- crear usuarios / grupos
- configurar servicios
- abrir puertos ...

Al usar puppet tendremos distintos tipos de archivos (muchos comparten sintaxis PDL... otros no YAML, erb=plantilla jinja )
- manifiestos... Estos manifiestos van por nodo o grupo de nodos administrados
    - Colección de recursos
    - Modulos
- modulos
    - Colección de recursos
- datos
- plantillas
- ficheros

# HIERA

Especie de BBDD con información que nos hace falta para nuestros entornos remotos configurarlos.
Es un resolvedor de información.

# Recursos

En puppet existen un buen numero de recursos disponibles.
Los recursos me aislan del SO que esté usando.. hasta cierto punto.

# MANIFIESTOS

Un manifiesto es un archivo que define los recursos que quiero o no (el estado)
para un determinado entorno o conjunto de entornos.

node ESPECIFICACION_DE_NODO {
    # Recursos que quiero para ese nodo o conjunto de nodos
}

# ESPECIFICACION_DE_NODO

Describe un nombre / nombres o patrón que debe seguir un nombre de un nodo, 
para que sea elegible / susceptible de tener la configuración que estamos definiendo

Cuando un agente solicita su actualización al servidor de puppet, entre otras cosas, manda su nombre de nodo. (hostname, habitualmente cualificado)

$ puppet apply ARGUMENTOS (se solicita a nivel de un NODO)