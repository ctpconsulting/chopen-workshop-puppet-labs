# Class: nginx::config
#
#
class nginx::config {

    $cat_site = 'cat-pictures'

    file { '/var/www':
        ensure  => directory,
    }

    tidy { "/var/www/${cat_site}":
        recurse => true,
        require => File["/var/www/${cat_site}"]
    }

    file { "/var/www/${cat_site}/index.html":
        source  => 'puppet:///modules/nginx/index.html',
        require => Tidy["/var/www/${cat_site}"],
    }

    file { '/etc/nginx/sites-enabled/default':
        ensure  => absent,
        notify  => Service['nginx'],
    }

    file { '/etc/nginx/sites-available/default':
        ensure  => absent,
        notify  => Service['nginx'],
    }

    nginx::vhost { $cat_site:
        port    => 80,
    }

}