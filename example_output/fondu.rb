name :
	 Fondu
homepage :
	 https://fondu.sourceforge.io/
url :
	 https://fondu.sourceforge.io/fondu_src-060102.tgz
description :
	 Tools to convert between different font formats
build_deps :
link_deps :
optional_deps :
conflicts :
	 cspice
resource :
	 ['cminch.ttf']
	 ['http://mirrors.ctan.org/fonts/cm/ps-type1/bakoma/ttf/cminch.ttf']
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--exec-prefix=#{prefix}"
	 system "make", "install"
	 man1.install Dir["*.1"]
