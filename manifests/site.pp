node default {

    file { '/etc/motd':
        content => 'Good day, Mr Amer. Everything is going extremely well.',
    }

}

node 'ubuntu' inherits default {

    include nginx

}