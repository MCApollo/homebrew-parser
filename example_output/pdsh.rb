name :
	 Pdsh
homepage :
	 https://github.com/chaos/pdsh
url :
	 https://github.com/chaos/pdsh/releases/download/pdsh-2.33/pdsh-2.33.tar.gz
description :
	 Efficient rsh-like utility, for using hosts in parallel
build_deps :
link_deps :
	 readline
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = %W[
	 --prefix=#{prefix}
	 --mandir=#{man}
	 --with-nodeupdown
	 --with-readline
	 --with-ssh
	 --without-dshgroups
	 --without-rsh
	 --without-xcpu
	 ]
	 system "./configure", *args
	 system "make", "install"
