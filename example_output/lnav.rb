name :
	 Lnav
homepage :
	 https://github.com/tstack/lnav
url :
	 https://github.com/tstack/lnav/releases/download/v0.8.4/lnav-0.8.4.tar.gz
description :
	 Curses-based tool for viewing and analyzing log files
build_deps :
link_deps :
	 pcre
	 readline
	 sqlite
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.delete("SDKROOT")
	 system "./autogen.sh" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--with-readline=#{Formula["readline"].opt_prefix}"
	 system "make", "install"
