# Class: nginx::ubuntu::ppa
#
#
class nginx::ubuntu::ppa {

	$ppa_added = 'grep ^ /etc/apt/sources.list /etc/apt/sources.list.d/* | grep nginx'
	$path = '/usr/bin:/usr/sbin:/bin:/usr/local/bin'

	package { 'python-software-properties':
		ensure => installed,
	}

	exec { 'add-nginx-ppa':
        command => 'add-apt-repository ppa:nginx/stable',
        path    => $path,
        unless  => $ppa_added,
        require => Package['python-software-properties']
    } ->
    exec { 'update-ppa':
        command => 'apt-get update',
        path    => $path,
        unless  => $ppa_added,
    }

    class { 'nginx::packageconfig':
    	require => Exec['update-ppa']
	}

}