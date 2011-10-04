class mysql::server {
	include mysql::server::install
	include mysql::server::service
	include mysql::server::config
}
