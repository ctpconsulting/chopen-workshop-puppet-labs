# Class: nginx
#
#
class nginx(
    $version = undef
) {

    include nginx::service
    include nginx::config

    class { '::mysql::server':
        root_password => 'chopen_root',
    }

    mysql::db { 'chopen':
        user     => 'chopen',
        password => 'chopen',
        host     => 'localhost',
        grant    => ['SELECT', 'UPDATE'],
    }

}