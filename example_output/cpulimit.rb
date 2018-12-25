name :
	 Cpulimit
homepage :
	 https://github.com/opsengine/cpulimit
url :
	 https://github.com/opsengine/cpulimit/archive/v0.2.tar.gz
description :
	 CPU usage limiter
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "src/cpulimit"
