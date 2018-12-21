name :
	 Fourstore
homepage :
	 https://github.com/4store/4store
url :
	 https://github.com/4store/4store/archive/v1.1.6.tar.gz
description :
	 Efficient, stable RDF database
build_deps :
	 autoconf
	 automake
	 libtool
	 pkg-config
link_deps :
	 gettext
	 glib
	 pcre
	 raptor
	 rasqal
conflicts :
patches :
EOF_patch :
install :
	 (buildpath/".version").write("v1.1.6")
	 system "./autogen.sh"
	 (var/"fourstore").mkpath
	 system "./configure", "--prefix=#{prefix}",
	 "--with-storage-path=#{var}/fourstore",
	 "--sysconfdir=#{etc}/fourstore"
	 system "make", "install"
