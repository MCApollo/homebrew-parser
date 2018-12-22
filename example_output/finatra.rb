name :
	 Finatra
homepage :
	 http://finatra.info/
url :
	 https://github.com/twitter/finatra/archive/1.5.3.tar.gz
description :
	 Scala web framework inspired by Sinatra
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 libexec.install Dir["*"]
	 bin.install_symlink libexec/"finatra"
