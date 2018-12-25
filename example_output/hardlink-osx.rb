name :
	 HardlinkOsx
homepage :
	 https://github.com/selkhateeb/hardlink
url :
	 https://github.com/selkhateeb/hardlink/archive/v0.1.1.tar.gz
description :
	 Command-line utility that implements hardlinks on macOS
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
	 bin.mkdir
	 system "make", "install", "PREFIX=#{prefix}"
