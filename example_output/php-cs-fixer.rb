name :
	 PhpCsFixer
homepage :
	 https://cs.sensiolabs.org/
url :
	 https://github.com/FriendsOfPHP/PHP-CS-Fixer/releases/download/v2.13.1/php-cs-fixer.phar
description :
	 Tool to automatically fix PHP coding standards issues
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
	 bin.install "php-cs-fixer.phar" => "php-cs-fixer"
