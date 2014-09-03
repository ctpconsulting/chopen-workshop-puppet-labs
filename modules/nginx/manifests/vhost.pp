# Define: nginx::vhost
# Parameters:
# arguments
#
define nginx::vhost ($port, $site_name = $title) {

    $site_server = "${site_name}.com"

    file { "/var/www/${site_name}":
        ensure  => directory,
        require => File['/var/www']
    }

    file { "/etc/nginx/sites-enabled/${site_name}.conf":
        content => template('nginx/vhost.conf.erb'),
        notify  => Service['nginx'],
        require => [ Package['nginx'], File["/var/www/${site_name}"] ]
    }

    file { "/etc/nginx/sites-available/${site_name}.conf":
        target  => "/etc/nginx/sites-enabled/${site_name}.conf",
        require => File["/etc/nginx/sites-enabled/${site_name}.conf"],
    }

}