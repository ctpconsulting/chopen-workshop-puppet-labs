# Class: nginx
#
#
class nginx {

    package { 'nginx':
        ensure => installed,
    }

}