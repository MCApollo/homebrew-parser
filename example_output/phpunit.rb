name :
	 Phpunit
homepage :
	 https://phpunit.de
url :
	 https://phar.phpunit.de/phpunit-7.5.1.phar
description :
	 Programmer-oriented testing framework for PHP
build_deps :
link_deps :
	 php
conflicts :
patches :
EOF_patch :
install :
	 bin.install "phpunit-#{version}.phar" => "phpunit"
