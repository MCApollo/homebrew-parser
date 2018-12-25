name :
	 Mimic
homepage :
	 https://mimic.mycroft.ai
url :
	 https://github.com/MycroftAI/mimic/archive/1.2.0.2.tar.gz
description :
	 Lightweight text-to-speech engine based on CMU Flite
build_deps :
	 autoconf
	 automake
	 libtool
	 pkg-config
link_deps :
	 icu4c
	 portaudio
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./autogen.sh"
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--enable-shared",
	 "--enable-static",
	 "--prefix=#{prefix}"
	 system "make", "install"
