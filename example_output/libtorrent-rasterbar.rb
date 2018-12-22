name :
	 LibtorrentRasterbar
homepage :
	 https://www.libtorrent.org/
url :
	 https://github.com/arvidn/libtorrent/releases/download/libtorrent_1_1_11/libtorrent-rasterbar-1.1.11.tar.gz
description :
	 C++ bittorrent library by Rasterbar Software
build_deps :
	 pkg-config
link_deps :
	 boost
	 boost-python3
	 openssl
	 python
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11
	 args = %W[
	 --disable-debug
	 --disable-dependency-tracking
	 --disable-silent-rules
	 --prefix=#{prefix}
	 --enable-encryption
	 --enable-python-binding
	 --with-boost=#{Formula["boost"].opt_prefix}
	 --with-boost-python=boost_python37-mt
	 PYTHON=python3
	 ]
	 if build.head?
	 system "./bootstrap.sh", *args
	 else
	 system "./configure", *args
	 end
	 system "make", "install"
	 libexec.install "examples"
