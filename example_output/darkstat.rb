name :
	 Darkstat
homepage :
	 https://unix4lyfe.org/darkstat/
url :
	 https://unix4lyfe.org/darkstat/darkstat-3.0.719.tar.bz2
description :
	 Network traffic analyzer
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/442ce4a5/darkstat/clock_gettime.patch
EOF_patch :
install :
	 system "autoreconf", "-iv" if build.head?
	 system "./configure", "--disable-debug", "--prefix=#{prefix}"
	 system "make", "install"
