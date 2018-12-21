name :
	 Libnatpmp
homepage :
	 http://miniupnp.free.fr/libnatpmp.html
url :
	 http://miniupnp.free.fr/files/download.php?file=libnatpmp-20150609.tar.gz
description :
	 NAT port mapping protocol library
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 inreplace "Makefile", "-Wl,-install_name,$(SONAME)", "-Wl,-install_name,$(INSTALLDIRLIB)/$(SONAME)"
	 system "make", "INSTALLPREFIX=#{prefix}", "install"
