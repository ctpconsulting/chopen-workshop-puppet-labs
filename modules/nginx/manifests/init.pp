# Class: nginx
#
#
class nginx(

    $version = undef,
    $mysql_user = $nginx::params::mysql_user,
    $mysql_password = undef

) inherits nginx::params {

    if ($mysql_password == undef) {
        fail('MySQL DB password must be set!')
    }

    include nginx::service
    include nginx::config

    class { '::mysql::server':
        root_password => 'chopen_root',
    }

    mysql::db { 'chopen':
        user     => $mysql_user,
        password => $mysql_password,
        host     => 'localhost',
        grant    => ['SELECT', 'UPDATE'],
    }

}