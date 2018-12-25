name :
	 CmuPocketsphinx
homepage :
	 https://cmusphinx.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/cmusphinx/pocketsphinx/0.8/pocketsphinx-0.8.tar.gz
description :
	 Lightweight speech recognition engine for mobile devices
build_deps :
	 pkg-config
link_deps :
	 cmu-sphinxbase
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 if build.head?
	 ENV["NOCONFIGURE"] = "yes"
	 system "./autogen.sh"
	 end
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
