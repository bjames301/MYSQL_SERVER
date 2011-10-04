
##################################################################################
#Coments Section
#Wed Jun 22 08:16:11 EDT 2011
#Brandon James


#################################################################################
#Config Section
#
#


class mysql::server::config {

	include mysql::params

	if !defined(File['build_dir']) {
        	file { 'build_dir':
                	path   => '/etc/puppet/build',
                	ensure => directory,
        	}
	}
	
	
	file { 'mysql':
                path   => '/etc/puppet/build/mysql',
                ensure => directory,
        }


	file {'/etc/puppet/build/mysql/mysql.sql':
		content => template('mysql/mysql.erb'),
		ensure  => present,
		require => Class["mysql::server::install"],
		notify  => Exec['setrootpass'],
	}


	exec { 'setrootpass':
		command     => "/usr/bin/mysql < /etc/puppet/build/mysql/mysql.sql",
		require     => Class['mysql::server::service'],
		refreshonly => true,
	} 
}








################################################################################
