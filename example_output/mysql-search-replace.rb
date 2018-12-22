name :
	 MysqlSearchReplace
homepage :
	 https://interconnectit.com/products/search-and-replace-for-wordpress-databases/
url :
	 https://github.com/interconnectit/Search-Replace-DB/archive/3.1.tar.gz
description :
	 Database search and replace script in PHP
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 libexec.install "srdb.class.php"
	 libexec.install "srdb.cli.php" => "srdb"
	 chmod 0755, libexec/"srdb"
	 bin.install_symlink libexec/"srdb"
