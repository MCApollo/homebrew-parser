name :
	 Sshfs
homepage :
	 https://osxfuse.github.io/
url :
	 https://github.com/libfuse/sshfs/releases/download/sshfs-2.10/sshfs-2.10.tar.gz
description :
	 File system client based on SSH File Transfer Protocol
build_deps :
	 autoconf
	 automake
	 libtool
	 pkg-config
link_deps :
	 glib
	 :osxfuse
conflicts :
patches :
EOF_patch :
install :
	 args = %W[
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 ]
	 args << "--disable-sshnodelay" if build.without? "sshnodelay"
	 system "./configure", *args
	 system "make", "install"
