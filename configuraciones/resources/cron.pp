cron { 'nombre-arbitrario':
    ensure => present, # absent
    command => '',
    user => 'usuario con que se ejecuta el comando',
    minute => '',
    hour => '',
    month => '',
    monthday => '',
    weekday => '',
}

# Qué era UNIX®?
# Un sistema operativo creado por la gente de los labs Bell de AT&T

# Qué es UNIX®?
# Unix es una especificación (de hecho 2: SUS, POSIX) acerca de cómo montar un SO.

# Linux < Es un kernel de SO que se supone que sigue /cumple esas especificaciones... pero no lo sabemos

# Linux no es un SO UNIX®
# Linux es un kernel de SO tipo UNIX, como por ejemplo, 386BSD

# GNU=GNU is NOT UNIX
# Kernel Linux + Librerias GNU -> GNU/Linux > Redhat , Suse, Debian, Ubuntu, Fedora...
# Kernel Linux + Otras librerias aparte de GNU > Android

# HP     -> HP-UX < SO UNIX®
# Oracle -> Solaris
# IBM    -> AIX
# MacOS  -> SO UNIX®