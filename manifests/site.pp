file { '/etc/motd':
    content => 'Good afternoon, Mr Amer. Everything is going extremely well.',
}

file { ['/tmp/puppet', '/tmp/puppet/files']:
    ensure => directory,
} ->
file { '/tmp/puppet/files/test':
    content => 'This is a test',
    owner   => 'chopen',
    mode    => 'u+r-wx'
}
