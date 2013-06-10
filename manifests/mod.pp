####
#
#
#
define apache::mod
{
    $mod = $name

    # mod => package
    $mod_packages = {
        'php5' => 'libapache2-mod-php5',
    }

    $package = $mod_packages[$mod]

    package { $package:
        ensure  => present,
        require => Package['apache2'],
    }

    exec { 'a2enmod':
        command => "/usr/sbin/a2enmod ${mod}",
        creates => "/etc/apache2/mods-enabled/${mod}.conf",
        require => [Package['apache2'], Package[$package]],
        notify  => Service['apache2'],
    }

}
