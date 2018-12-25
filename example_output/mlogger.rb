name :
	 Mlogger
homepage :
	 https://github.com/nbrownus/mlogger
url :
	 https://github.com/nbrownus/mlogger/archive/v1.2.0.tar.gz
description :
	 Log to syslog from the command-line
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
	 bin.install "mlogger"
