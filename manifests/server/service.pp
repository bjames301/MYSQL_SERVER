#

class mysql::server::service {

	
	service{ 'mysqld':
		ensure	   => running,
		enable     => true,
		hasstatus  => true,
		hasrestart => true,
		require    => Class["mysql::server::install"],
	}
	

}







