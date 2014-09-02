# Class: nginx::service
#
#
class nginx::service {

    package { 'nginx':
        ensure => installed,
    }

    service { 'nginx':
        enable      => true,
        ensure      => running,
        require     => Package['nginx'],
    }

}