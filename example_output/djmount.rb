name :
	 Djmount
homepage :
	 https://djmount.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/djmount/djmount/0.71/djmount-0.71.tar.gz
description :
	 File system client for mounting network media servers
build_deps :
	 pkg-config
link_deps :
	 libupnp
	 :osxfuse
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://raw.githubusercontent.com/DomT4/scripts/ee974414da/Homebrew_Resources/djmount/djmount.diff
EOF_patch :
install :
	 ENV["FUSE_CFLAGS"] = `pkg-config fuse --cflags`.chomp
	 ENV["FUSE_LIBS"] = `pkg-config fuse --libs`.chomp
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--with-external-libupnp",
	 "--with-libupnp-prefix=#{HOMEBREW_PREFIX}"
	 system "make"
	 system "make", "install"
