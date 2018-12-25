name :
	 PhpCodeSniffer
homepage :
	 https://github.com/squizlabs/PHP_CodeSniffer/
url :
	 https://github.com/squizlabs/PHP_CodeSniffer/releases/download/3.3.2/phpcs.phar
description :
	 Check coding standards in PHP, JavaScript and CSS
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 ['phpcbf.phar']
	 ['https://github.com/squizlabs/PHP_CodeSniffer/releases/download/3.3.2/phpcbf.phar']
patches :
EOF_patch :
install :
	 bin.install "phpcs.phar" => "phpcs"
	 resource("phpcbf.phar").stage { bin.install "phpcbf.phar" => "phpcbf" }
