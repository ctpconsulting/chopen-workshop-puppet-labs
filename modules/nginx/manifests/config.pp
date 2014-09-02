# Class: nginx::config
#
#
class nginx::config {

    file { ['/var/www', '/var/www/cat-pictures']:
        ensure  => directory,
    }

    file { '/var/www/cat-pictures/index.html':
        source  => 'puppet:///modules/nginx/index.html',
        require => File['/var/www/cat-pictures'],
    }

    file { '/etc/nginx/sites-enabled/default':
        source  => 'puppet:///modules/nginx/cat-pictures.conf',
        notify  => Service['nginx'],
        require => [ Package['nginx'], File['/var/www/cat-pictures'] ]
    }

}