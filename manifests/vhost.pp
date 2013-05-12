####
#
#
#
define apache::vhost(
    $document_root,
    $port           = 80,
    $priority       = 0,
    $options        = 'MultiViews FollowSymlinks',
    $allow_override = 'All',
    $template       = 'apache/vhost.erb',
    $server_name    = '',
    $server_alias   = ''
)
{

    file { "${priority}-${name}.conf":
        ensure  => present,
        path    => "/etc/apache2/sites-enabled/${priority}-${$name}.conf",
        content => template($template),
        owner   => 'root',
        group   => 'root',
        mode    => '0755',
        require => Package['apache2'],
        notify  => Service['apache2'],
    }

}
