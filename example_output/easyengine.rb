name :
	 Easyengine
homepage :
	 https://easyengine.io/
url :
	 https://github.com/EasyEngine/easyengine/releases/download/v4.0.6/easyengine.phar
description :
	 Command-line control panel to manage WordPress sites
build_deps :
link_deps :
	 dnsmasq
	 php
conflicts :
patches :
EOF_patch :
install :
	 bin.install "easyengine.phar" => "ee"
