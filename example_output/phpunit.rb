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
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 bin.install "phpunit-#{version}.phar" => "phpunit"
