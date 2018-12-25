name :
	 Portaudio
homepage :
	 http://www.portaudio.com
url :
	 http://www.portaudio.com/archives/pa_stable_v190600_20161030.tgz
description :
	 Cross-platform library for audio I/O
build_deps :
	 pkg-config
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}",
	 "--disable-debug",
	 "--disable-dependency-tracking",
	 "--enable-mac-universal=no",
	 "--enable-cxx"
	 system "make", "install"
	 include.install "include/pa_mac_core.h"
