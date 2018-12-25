name :
	 Writerperfect
homepage :
	 https://sourceforge.net/p/libwpd/wiki/writerperfect/
url :
	 https://downloads.sourceforge.net/project/libwpd/writerperfect/writerperfect-0.9.6/writerperfect-0.9.6.tar.xz
description :
	 Library for importing WordPerfect documents
build_deps :
	 boost
	 pkg-config
link_deps :
	 libodfgen
	 libwpd
	 libwpg
	 libwps
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
