name :
	 Composer
homepage :
	 https://getcomposer.org/
url :
	 https://getcomposer.org/download/1.8.0/composer.phar
description :
	 Dependency Manager for PHP
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 bin.install "composer.phar" => "composer"
