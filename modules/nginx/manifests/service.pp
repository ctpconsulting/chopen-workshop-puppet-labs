# Class: nginx::service
#
#
class nginx::service {

    if ($nginx::version == undef) {
        $package_version = latest
    } else {
        $package_version = $nginx::version
    }

    case $::operatingsystem {
        'Ubuntu': {
            include nginx::ubuntu::ppa
        }
        default: {
            include nginx::packageconfig
        }
    }

    package { 'nginx':
        ensure  => $package_version,
        require => Class['nginx::packageconfig']
    }

    service { 'nginx':
        enable      => true,
        ensure      => running,
        require     => Package['nginx'],
    }

}