name :
	 Phpmyadmin
homepage :
	 https://www.phpmyadmin.net
url :
	 https://files.phpmyadmin.net/phpMyAdmin/4.8.4/phpMyAdmin-4.8.4-all-languages.tar.gz
description :
	 Web interface for MySQL and MariaDB
build_deps :
link_deps :
	 php
conflicts :
patches :
EOF_patch :
install :
	 pkgshare.install Dir["*"]
	 etc.install pkgshare/"config.sample.inc.php" => "phpmyadmin.config.inc.php"
	 ln_s etc/"phpmyadmin.config.inc.php", pkgshare/"config.inc.php"
