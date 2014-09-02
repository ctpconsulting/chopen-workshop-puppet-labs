node default {

    file { '/etc/motd':
        content => 'Good day, Mr Amer. Everything is going extremely well.',
    }

}

node 'ubuntu' inherits default {

    class { 'nginx':
        version => '1.6.0-1+trusty0'
    }

}