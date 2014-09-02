# Class: nginx
#
#
class nginx(
    $version = undef
) {

    include nginx::service
    include nginx::config

}