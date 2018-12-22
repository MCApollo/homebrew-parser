name :
	 CmuSphinxbase
homepage :
	 https://cmusphinx.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/cmusphinx/sphinxbase/0.8/sphinxbase-0.8.tar.gz
description :
	 Lightweight speech recognition engine for mobile devices
build_deps :
	 pkg-config
link_deps :
	 libsamplerate
	 libsndfile
conflicts :
patches :
EOF_patch :
install :
	 if build.head?
	 ENV["NOCONFIGURE"] = "yes"
	 system "./autogen.sh"
	 end
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
