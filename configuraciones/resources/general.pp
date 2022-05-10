# Comentarios tipo shell, python, ruby

/*
Comentarios en bloque, como en:
- C 
- Java
- ...
*/

# Al definir un recurso, sea cual sea:
TIPO_RECURSO { 'nombre o identificador':
    # ese nombre no es un id interno.
    # Por ejemplo, para un usuario, será el nombre del usuario
    # Para un fichero, será la ruta del fichero
    # Para un paquete será el paquete que quiero instalar o desinstalar
    
    # A continuación damos las características (configuración) del recurso.
    # Para cada configuración (que dependerá del tipo de recurso que estemos definiendo)
    PROPIEDAD_A_CONFIGURAR_1 => 'VALOR1',
    PROPIEDAD_A_CONFIGURAR_2 => 'VALOR2',
    #...
    PROPIEDAD_A_CONFIGURAR_N => 'VALORN',
}

