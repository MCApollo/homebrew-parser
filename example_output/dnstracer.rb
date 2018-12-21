name :
	 Dnstracer
homepage :
	 https://www.mavetju.org/unix/dnstracer.php
url :
	 https://www.mavetju.org/download/dnstracer-1.9.tar.gz
description :
	 Trace a chain of DNS servers to the source
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV.append "LDFLAGS", "-lresolv"
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make", "install"
