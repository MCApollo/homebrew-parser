name :
	 Pacapt
homepage :
	 https://github.com/icy/pacapt
url :
	 https://github.com/icy/pacapt/archive/v2.4.0.tar.gz
description :
	 Package manager in the style of Arch's pacman
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
	 system "make", "install", "BINDIR=#{bin}", "VERSION=#{version}"
