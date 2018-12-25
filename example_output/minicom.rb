name :
	 Minicom
homepage :
	 https://packages.debian.org/sid/minicom
url :
	 https://mirrors.ocf.berkeley.edu/debian/pool/main/m/minicom/minicom_2.7.1.orig.tar.gz
description :
	 Menu-driven communications program
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
	 ENV["LIBS"] = "-liconv"
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make", "install"
	 (prefix/"etc").mkdir
	 (prefix/"var").mkdir
	 (prefix/"etc/minirc.dfl").write "pu lock #{prefix}/var\npu escape-key Escape (Meta)\n"
