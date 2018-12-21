name :
	 SimpleMtpfs
homepage :
	 https://github.com/phatina/simple-mtpfs
url :
	 https://github.com/phatina/simple-mtpfs/archive/simple-mtpfs-0.3.0.tar.gz
description :
	 Simple MTP fuse filesystem driver
build_deps :
	 autoconf
	 automake
	 pkg-config
link_deps :
	 libmtp
	 :osxfuse
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11
	 system "./autogen.sh"
	 system "./configure", "--prefix=#{prefix}", "CPPFLAGS=-I/usr/local/include/osxfuse",
	 "LDFLAGS=-L/usr/local/include/osxfuse"
	 system "make"
	 system "make", "install"
