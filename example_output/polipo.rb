name :
	 Polipo
homepage :
	 https://www.irif.univ-paris-diderot.fr/~jch/software/polipo/
url :
	 https://www.irif.univ-paris-diderot.fr/~jch/software/files/polipo/polipo-1.1.1.tar.gz
description :
	 Web caching proxy
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 cache_root = (var + "cache/polipo")
	 cache_root.mkpath
	 args = %W[
	 PREFIX=#{prefix}
	 LOCAL_ROOT=#{pkgshare}/www
	 DISK_CACHE_ROOT=#{cache_root}
	 MANDIR=#{man}
	 INFODIR=#{info}
	 PLATFORM_DEFINES=-DHAVE_IPv6
	 ]
	 system "make", "all", *args
	 system "make", "install", *args
