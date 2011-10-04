#

class mysql::server::install {

	$packages = ['mysql-server','mysql','php-mysql']	
	
	package{ $packages:
		ensure	=> present,
	}
	

}







