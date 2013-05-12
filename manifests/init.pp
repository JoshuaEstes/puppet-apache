####
#
# Manages apache2 service
#
class apache
{

    package { 'apache2':
        ensure => installed,
    }

    service { 'apache2':
        ensure => true,
        enable => true,
    }

    file { '/etc/apache2/sites-enabled':
        ensure  => directory,
        recurse => true,
        path    => '/etc/apache2/sites-enabled',
        purge   => true,
        notify  => Service['apache2'],
        require => Package['apache2'],
    }

    file { '/etc/apache2/apache2.conf':
        ensure  => present,
        content => template('apache/apache2.conf.erb'),
        notify  => Service['apache2'],
        require => Package['apache2'],
    }

    file { '/etc/apache2/conf.d/httpd.conf':
        ensure  => present,
        content => template('apache/httpd.conf.erb'),
        notify  => Service['apache2'],
        require => Package['apache2'],
    }

    file { '/etc/apache2/conf.d/security':
        ensure  => present,
        content => template('apache/security.erb'),
        notify  => Service['apache2'],
        require => Package['apache2'],
    }

}
