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
        hasstatus   => false, # this is just for practicing...
        pattern     => 'nginx',
        require     => Package['nginx'],
    }

}