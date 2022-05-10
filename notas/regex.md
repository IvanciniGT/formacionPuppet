# Regex

Creamos patrones y comprobamos si un texto cumple o no con un patrón.
en el caso de puppet las usamos para identificar nodos.

Una expresión regular consta de una secuencia de subpatrones.

Un subpatrón consta de 2 partes:
 - Una primera parte donde establecemos una secuencia de caracteres.
        - mysql      Literalmente, esa secuencia de caracteres debe aparecer
        - .sql       La palabra sql debe aparecer con un caracter previo el que sea.
                     El caracter . identifica a cualquier caracter
        - [1mi]      Eso significa que el texto debe incluir alguno (solo uno) de esos caracteres
        - [mysql]    Eso significa que mi texto debe contener una m, o una y, o una s....
        - [a-z]      Cualquier letra de la a a la z
        - [A-Z]
        - [0-9]      Cualquier dígito... no números
        - [a-z5-9ñáâ]
        - [.]        Si quiero un punto, punto de verdad punto, esa es la sintaxis
    
 - Una segunda parte donde indicamos la cantidad de veces que esa secuencia debe aparecer.
    - si no digo nada, debe apaecer 1 vez
    - ?     Puede aparecer o no
    - +     Debe aparecer al menos 1 vez
    - *     Puede no aparecer o aparecer tantas veces como quiera
    - {3}   3 veces tiene que aparecer
    - {2,4} 2, 3 o 4 veces
    - {,7}  Hasta 7 veces

Adicionalmente tenemos otros caracteres importantes:
 - $ Fin de texto
 - ^ Comienzo de texto
 - | "o" Por ejemplo:  mysql|mariadb
 - () Se usan para agrupar subpatrones

PARA MONTAR REGEX: usar https://regex101.com/

## EJEMPLO: 

# Solo quiero 20 maquinas

mysql1.cualquierentorno.es
mariadb11.otroentorno.es

demo.mysql1.cualquierentorno.es
demo.mysql1.es
mysql111.entorno.es
mysql17.es


^               Que comience por
mysql|mariadb   Subpatron 1
                Subpatron 2: Números del 1 al 20
[.]             Subpatron 3: Un punto, literal
.+              Subpatron 4: Cualquier entorno: es decir
                    Cualquier caracter al menos 1 vez
[.]             Subpatrón 5: Otro punto               
es              Subpatón fijo: es, 1 única vez
$               Que acabe por

^mysql|mariadb = Todo lo que empiece por mysql o contenga mariadb 
                 El ^ se junta con el mysql, antes de el signo |
                 
^(mysql|mariadb)(([1-9])|(1[0-9])|(20))[.].+[.]es$

NUMERO: del 1 al 20

([1-9])       1, 2, 3, 4, 5, 6, 7, 8, 9
(1[0-9])      10, 11, 12, 13, 14, 15, 16, 17, 18, 19
(20)          20

(([1-9])|(1[0-9])|(20))