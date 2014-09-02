# Class: nginx
#
#
class nginx {

    include nginx::service
    include nginx::config

}