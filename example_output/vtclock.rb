name :
	 Vtclock
homepage :
	 https://webonastick.com/vtclock/
url :
	 https://webonastick.com/vtclock/vtclock-2005-02-20.tar.gz
description :
	 Text-mode fullscreen digital clock
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
	 bin.install "vtclock"
