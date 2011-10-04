
##################################################################################
#Coments Section
#Wed Jun 22 08:16:11 EDT 2011
#Brandon James


#################################################################################
#Config Section
#This define assigns varibles for correctly configuring Ganglia.


define gangliaserver::server::config($datahostname, $datahostip, $datahostport, $owner, $location, 
$template1='mysql2/my.cnf.erb'){

	file {"/etc/my.cnf":
		content => template($template1),
		ensure  => present,
		owner   => "mysql",
		group   => "mysql",
		require => Class["mysql2::server::install"],
	}
}









################################################################################
