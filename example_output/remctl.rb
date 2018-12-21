name :
	 Remctl
homepage :
	 https://www.eyrie.org/~eagle/software/remctl/
url :
	 https://archives.eyrie.org/software/kerberos/remctl-3.15.tar.xz
description :
	 Client/server application for remote execution of tasks
build_deps :
link_deps :
	 libevent
	 pcre
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--with-pcre=#{HOMEBREW_PREFIX}"
	 system "make", "install"
