name :
	 Vttest
homepage :
	 https://invisible-island.net/vttest/
url :
	 https://invisible-mirror.net/archives/vttest/vttest-20140305.tgz
description :
	 Test compatibility of VT100-compatible terminals
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
	 system "./configure", "--prefix=#{prefix}", "--mandir=#{man}"
	 system "make"
	 system "make", "install"
