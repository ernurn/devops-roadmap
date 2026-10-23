Control de Permisos y Accesos en Linux
1. Cómo interpretar rwx
Los permisos en Linux se representan mediante una cadena de caracteres o su equivalente numérico (octal). Cada letra cumple una función específica:

r (Read / Lectura): Concede derecho a leer el contenido de un archivo o a listar los elementos contenidos dentro de un directorio.

w (Write / Escritura): Permite modificar, sobrescribir o eliminar un archivo, o bien crear, borrar y renombrar archivos dentro de un directorio.

x (Execute / Ejecución): Habilita la ejecución de un archivo como un script o binario, o permite el acceso de tránsito (cd) a un directorio.

Equivalencia numérica (Sistema Octal):
Cada posición se calcula sumando los valores binarios asignados: r = 4, w = 2, x = 1.

7 (rwx) = 4 + 2 + 1

5 (r-x) = 4 + 0 + 1

6 (rw-) = 4 + 2 + 0

2. Diferencia entre Propietario, Grupo y Otros
Linux divide los permisos de cualquier objeto en tres categorías independientes:

Propietario (User / Owner): Es el usuario creador o dueño absoluto del archivo o directorio. Tiene la potestad de alterar sus permisos utilizando chmod.

Grupo (Group): Un conjunto de usuarios que comparten un rol o contexto en el sistema. Permite otorgar privilegios comunes a varios colaboradores sin necesidad de abrirlos a todo el mundo.

Otros (Others / World): Cualquier usuario del sistema que no sea el propietario ni pertenezca al grupo asignado al archivo. Representa el nivel de acceso público o externo.

3. Diferencia entre Permisos de Archivos y Directorios
Aunque utilicen las mismas letras (rwx), el impacto práctico cambia radicalmente según el tipo de objeto:

En Archivos:

r: Permite abrir y leer el archivo.

w: Permite editar o vaciar el archivo.

x: Permite ejecutar el archivo como programa o proceso.

En Directorios:

r: Permite ver la lista de nombres de archivos que contiene (ls).

w: Permite crear nuevos archivos o eliminar los existentes dentro de él.

x: Permite ingresar al directorio (cd) y consultar los metadatos de los archivos internos. Nota: Sin permiso de ejecución en un directorio, tener permiso de lectura sobre sus archivos internos es inútil porque no se puede alcanzar su ruta.

4. Cómo cambiar permisos con chmod
El comando chmod (change mode) modifica los permisos de acceso. Se puede usar de dos formas:

A. Modo Octal (Numérico)
Se asignan tres dígitos (propietario, grupo, otros) sumando los valores de los permisos deseados:

Bash
chmod 755 archivo.sh
# 7 (rwx) para el usuario
# 5 (r-x) para el grupo
# 5 (r-x) para otros
B. Modo Simbólico
Se manipulan permisos específicos usando letras de categoría (u, g, o, a) y operadores (+, -, =):

Bash
# Agregar permiso de ejecución al propietario:
chmod u+x script.sh

# Quitar permisos de escritura a "otros":
chmod o-w documento.txt
5. Verificaciones con ls -l, stat y umask
ls -l: Muestra una vista tabular rápida que detalla el tipo de objeto, los permisos en formato de 10 caracteres (ej. -rw-rw-r--), el número de enlaces duros, el propietario y el grupo.

stat: Ofrece un diagnóstico profundo de bajo nivel. Permite visualizar los permisos exactos tanto en notación simbólica como en su valor octal exacto (ej. (0664/-rw-rw-r--)), además de las marcas de tiempo (timestamps) de acceso, modificación y cambio de inodos.

umask: Controla la máscara predeterminada de restricción. Define qué permisos se restan automáticamente al crear nuevos archivos o directorios (por ejemplo, una máscara 0002 aplicada sobre la base 666 de un archivo da como resultado permisos finales 664).

6. Diagnóstico y Resolución en el Mini Desafío
Durante la práctica de laboratorio con la máscara y los permisos, el diagnóstico de un comportamiento inesperado se abordó de la siguiente manera:

El Problema Detectado: Al intentar ejecutar un script o acceder a un directorio recién creado, el sistema denegó la acción arrojando un error de tipo Permission denied a pesar de que el usuario era el propietario.

Cómo se Diagnosticó:

Se inspeccionó el entorno ejecutando ls -l para verificar la cadena de permisos y comprobar que faltaba el bit de ejecución (x).

Se consultó el estado con stat para auditar el valor octal real del archivo y constatar cómo había influido el valor activo de la umask en su nacimiento.

La Solución: Una vez identificada la carencia de permisos específicos, se corrigió aplicando la directiva correspondiente mediante chmod u+x (o ajustando la máscara con umask), restaurando el acceso y la operatividad del recurso.
