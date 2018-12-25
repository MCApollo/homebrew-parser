name :
	 Libhttpserver
homepage :
	 https://github.com/etr/libhttpserver
url :
	 https://github.com/etr/libhttpserver/archive/0.15.0.tar.gz
description :
	 C++ library of embedded Rest HTTP server
build_deps :
	 autoconf
	 automake
	 libtool
	 pkg-config
link_deps :
	 libmicrohttpd
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = [
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 ]
	 system "./bootstrap"
	 mkdir "build" do
	 system "../configure", *args
	 system "make", "install"
	 end
	 pkgshare.install "examples"
