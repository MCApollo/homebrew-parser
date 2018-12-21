name :
	 Mtr
homepage :
	 https://www.bitwizard.nl/mtr/
url :
	 https://github.com/traviscross/mtr/archive/v0.92.tar.gz
description :
	 'traceroute' and 'ping' in a single tool
build_deps :
	 autoconf
	 automake
	 pkg-config
link_deps :
	 glib
	 gtk+
conflicts :
patches :
EOF_patch :
install :
	 ENV["LIBS"] = "-lresolv"
	 args = %W[
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 ]
	 args << "--without-gtk" if build.without? "gtk+"
	 args << "--without-glib" if build.without? "glib"
	 system "./bootstrap.sh"
	 system "./configure", *args
	 system "make", "install"
