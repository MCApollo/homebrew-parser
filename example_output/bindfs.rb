name :
	 Bindfs
homepage :
	 https://bindfs.org/
url :
	 https://bindfs.org/downloads/bindfs-1.13.9.tar.gz
description :
	 FUSE file system for mounting to another location
build_deps :
	 pkg-config
link_deps :
	 :osxfuse
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = %W[
	 --disable-debug
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 ]
	 if build.head?
	 system "./autogen.sh", *args
	 else
	 system "./configure", *args
	 end
	 system "make", "install"
