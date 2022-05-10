# Solicita la ejecución de un comando 
# El recurso exec ES MUY PELIGROSO, ya que , apriori, no asegura IDEMPOTENCIA
# Idempotencia implica que si ejecuto una configuración n veces, independientemente del estado inicial
# siempre llego al mismo estado final

# el prolema es que al estar lidiando con comandos/scripts, caemos en la tentación de usar lenguaje imperativo
# De hecho usamos lenguaje imperativo

# Queda de mi responsabilidad asegurar la idempotencia, es decir, que mi sistema no se verá afectado si 
# ejecuto el comando 500 veces

exec { 'nombre arbitrario':
    path => 'ruta comando', # /usr/bin
    command => 'comando con sus argumentos',
    user => 'usuario con el que queremos ejecutar el comando',
    cwd => 'working directory',
    returns => 'Código de respuesta esperado', # 0
    timeouts => 'Tiempo para determinar que el programa falló',
    onlyif => 'Un script cuyo valor determina si este comando debe ejecutarse',
    # Lo que miramos es el código de salida de ee comando : 0=SI ... NO 0=NO
    unless => 'Un script cuyo valor determina si este comando no debe ejecutarse',
    # Lo que miramos es el código de salida de ee comando : 0=NO ... NO 0=SI
    tries => 'numero de intentos si falla',
    try_sleep => 'tiempo en segundos entre reintentos',
}