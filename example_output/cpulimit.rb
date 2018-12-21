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
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "src/cpulimit"
