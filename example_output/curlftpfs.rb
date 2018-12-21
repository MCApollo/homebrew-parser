name :
	 Curlftpfs
homepage :
	 https://curlftpfs.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/curlftpfs/curlftpfs/0.9.2/curlftpfs-0.9.2.tar.gz
description :
	 Filesystem for accessing FTP hosts based on FUSE and libcurl
build_deps :
	 autoconf
	 automake
	 libtool
	 pkg-config
link_deps :
	 glib
	 :osxfuse
	 :x11
conflicts :
patches :
EOF_patch :
install :
	 ENV.append "CPPFLAGS", "-D__off_t=off_t"
	 system "autoreconf", "-fvi"
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
