node default {

    file { '/etc/motd':
        content => 'Good day, Mr Amer. Everything is going extremely well.',
    }

}

node 'ubuntu' inherits default {

    file { '/home/chopen/.bashrc':
        content => 'PS1="\`if [ \$? = 0 ]; then echo \[\e[33m\]^_^\[\e[0m\]; else echo \[\e[31m\]O_O\[\e[0m\]; fi\`[\u@\h:\w]\\$ "',
    }

}