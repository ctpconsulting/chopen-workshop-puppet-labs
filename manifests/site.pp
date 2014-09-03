node default {

    file { '/etc/motd':
        content => 'Good day, Mr Amer. Everything is going extremely well.',
    }

}

node 'ubuntu' inherits default {

    class { 'nginx':
        version => '1.6.0-1+trusty0'
    }

    class { '::ntp':
        servers => [ '0.ch.pool.ntp.org', '1.ch.pool.ntp.org', 
                     '2.ch.pool.ntp.org', '3.ch.pool.ntp.org' ],
    }

}