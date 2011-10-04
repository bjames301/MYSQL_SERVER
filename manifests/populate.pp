define mysql::populate(
	$user,
	$userpass,
	$databasename
) {
	
	 file {"/etc/puppet/build/mysql/${databasename}.sql":
                content => template('mysql/useranddatabase.erb'),
                ensure  => present,
                require => Class["mysql::server::config"],
                notify  => Exec["setupdatabase-${name}"],
        }

	
	exec {"setupdatabase-${name}":
		command      => "/usr/bin/mysql -u root -p${mysql::params::rootpass} < /etc/puppet/build/mysql/${databasename}.sql",
		require      => Class['mysql::server::config'],
		refreshonly  => true,
	}
}

