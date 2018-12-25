name :
	 Dterm
homepage :
	 http://www.knossos.net.nz/resources/free-software/dterm/
url :
	 http://www.knossos.net.nz/downloads/dterm-0.5.tgz
description :
	 Terminal emulator for use with xterm and friends
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
	 bin.mkpath
	 system "make"
	 system "make", "install", "BIN=#{bin}/"
