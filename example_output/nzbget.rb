name :
	 Nzbget
homepage :
	 https://nzbget.net/
url :
	 https://github.com/nzbget/nzbget/releases/download/v20.0/nzbget-20.0-src.tar.gz
description :
	 Binary newsgrabber for nzb files
build_deps :
	 pkg-config
link_deps :
	 gcc
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
	 (buildpath/"brew_include").install_symlink MacOS.sdk_path/"usr/include/ncurses.h"
	 ENV["ncurses_CFLAGS"] = "-I#{buildpath}/brew_include"
	 ENV["ncurses_LIBS"] = "-L/usr/lib -lncurses"
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--with-tlslib=OpenSSL"
	 system "make"
	 ENV.deparallelize
	 system "make", "install"
	 pkgshare.install_symlink "nzbget.conf" => "webui/nzbget.conf"
	 inreplace "nzbget.conf", "DirectWrite=yes", "DirectWrite=no"
	 inreplace "nzbget.conf", "ArticleCache=0", "ArticleCache=700"
	 etc.install "nzbget.conf"
