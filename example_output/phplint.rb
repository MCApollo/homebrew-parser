name :
	 Phplint
homepage :
	 http://www.icosaedro.it/phplint/
url :
	 http://www.icosaedro.it/phplint/phplint-3.2_20180727.tar.gz
description :
	 Validator and documentator for PHP 5 and 7 programs
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
	 inreplace "php", "/opt/php/bin/php", Formula["php"].opt_bin/"php"
	 libexec.install "modules", "php", "phpl", "stdlib", "utils"
	 bin.install_symlink libexec/"phpl"
