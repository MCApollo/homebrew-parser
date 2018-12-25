name :
	 Asio
homepage :
	 https://think-async.com/Asio
url :
	 https://downloads.sourceforge.net/project/asio/asio/1.12.1%20%28Stable%29/asio-1.12.1.tar.bz2
description :
	 Cross-platform C++ Library for asynchronous programming
build_deps :
	 autoconf
	 automake
link_deps :
	 openssl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.cxx11
	 if build.head?
	 cd "asio"
	 system "./autogen.sh"
	 else
	 system "autoconf"
	 end
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--with-boost=no"
	 system "make", "install"
	 pkgshare.install "src/examples"
