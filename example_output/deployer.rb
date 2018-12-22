name :
	 Deployer
homepage :
	 https://deployer.org/
url :
	 https://deployer.org/releases/v6.3.0/deployer.phar
description :
	 Deployment tool written in PHP with support for popular frameworks
build_deps :
link_deps :
	 php
conflicts :
	 dep
patches :
EOF_patch :
install :
	 bin.install "deployer.phar" => "dep"
