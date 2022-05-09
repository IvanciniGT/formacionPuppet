# Puppet 

Herramienta para automatizar configuraciones / instalaciones de entornos

Herramientas equivalentes: Ansible, Chef

Puppet requiere instalación en servidor y en nodos administrados (agente)
Ansible no requiere nada propio en nodos administrados.

Hasta la aparición de estas herramientas, qué usábamos para administrar estas configuraciones, 
planchar máquinas... cambios grupales, actualizaciones....

Qué ventaja tienen estas herramientas sobre el uso de Scripts para automatición de este tipo de tareas?

- Estandarización / Código ya hecho
- Diferencia de paradigma en el lenguaje que usamos

Un script sigue lo que denominamos un paradigma de programación IMPERATIVO.
En un paradigma IMPERATIVO, los programas son secuencias de órdenes.
Esta forma de escribir código es muy compleja, sobre todo si quiero hacer código de mucha calidad.

- Quiero tener un servidor web instalado en una máquina: nginx <<< DECLARATIVO

    ------------------------------------------------------------------
    script:
    ------------------------------------------------------------------
        Declara  la fuente: Añadir un repo desde el que descargar el código...
                            O descargarlo desde una determinada URL
        Instala nginx desde esa fuente
        Crea el usuario: servidorweb
            Pero si yo ejecuto ese comando y el usuario ya existe... posiblemente explote
        Aplica una determinada configuración al servidor web si no está aplicada ya... IF
            Copiar un fichero
        If hay Cambio en la configuración:
            Reinicia el servidor web

- En qué estado está mi servidor... ese servidor donde quiero instalar nginx?
  Quizás tiene ya nginx... Y no quiero reinstalar
                           O quiero que si hay una versión nueva, se actualice... o no
  Ese nginx... si ya está instalado, está funcionando o esta corrupto?
  Quizás estaba ejecutándose el script ... y se colgó el ordenador a medias... y cómo habrá quedado aquello?

En la práctica, quiero hacer cosas como:
- Instalar un servidor web
- Configurarlo
- Crear usuario
- Instalar una página o app web dentro de ese servidor web
- Configurar un servicio para su arranque 
- Abrir puertos
- ... y otras 20 cosas más.

En puppet y Ansible trabajamos con un paradigma DECLARATIVO.
No uso verbos. Escribo lo que quiero/necesito tener en mi máquina.
Describo el estado en el quiero mi máquina, con independencia del estado en el que se encuentre.
-----------------------v------------------  ---------------------------v-----------------------
              Paradigma declarativo                               Idenpotencia
              
              
Quiero tener nginx instalado en una máquina <<< DECLARATIVO        
    Aquí puppet/Ansible, ellos toman control/responsabilidad de la tarea:
        Ellos son los que deben averiguar que hay que hacer para dejar el sistema en ese estado
Instala nginx en una máquina <<< IMPERATIVO


En puppet existen los llamados modulos / equivalente a los roles de ansible
En puppet esos módulos los encontramos en forge.puppet.com
En ansible los roles los encontramos en ansible-galaxy

# Arquitectura

            Servidor Puppet (puppetserver) (3)
                           |
       ---------------------->(4)-----------(2)
       |                                     ^
       Maquina 1                        Maquina 2: puppet-agent (1)

Paso 1: El agente recopila información del entorno administrado: FACTS
Paso 2: El agente manda esa información al servidor de puppet, y le pregunta:
        Estoy bien...?
        O tengo que hacerme algún tratamiento?
Paso 3: El servidor analiza la configuración del entorno administrado 
        con el estado declarado / deseado para ese entorno administrado
Paso 4: Se manda información de vuelta al agente (catálogo) con las cosas que 
        habría que solventar / hacer para alcanzar ese estado deseado

Ansible hace push de las configuraciones / operaciones
Puppet hace pull de las configuraciones / operaciones

Puppet tiene su propio lenguaje para declarar esos estados (manifiestos): PuppetDL
Ansible usa un lenguaje más general y más difundido para escribir esos estados (playbooks): YAML

Dentro de esos archivos de manifiesto, declaramos: RECURSOS
    El equivalente en ansible serían las tareas (tasks)

Un módulo(puppet) es un conjunto de recursos
Un role(ansible) es un conjunto de tasks (tareas)

La comunicación entre un servidor de puppet y sus entornos administrados se hace a través de 
protocolo HTTPs. La 'S'? Capa TLS, aporta seguridad. Ayuda a frustrar 2 tipos de ataques:

- Man in the middle             \  Ataques
- Suplantación de identidad     /
- No repudio

Una comunicación SSL implica el uso de certificados....
Los certificados sólo valen si están firmados / Autenticados.
Va firmado por alguien en quien confio

Esos certificados nosotros los necesitamos tener en cada máquina remota...
Cada máquina remota tiene su propio certificado, que tiene que estar firmado.


# Pasos instalar:

Dar de alta el repo de puppet: Ambas máquinas 
    - Servidor
    - Nodo(s) 1 ... o 500
Instalar Servidor:
    - Paquete puppetserver
Instalar agente:
    - Paquete puppet
Nodo:
    - Generar certificado
Servidor:
    - Firmar certificado

