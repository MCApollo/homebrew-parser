name :
	 Libmms
homepage :
	 https://sourceforge.net/projects/libmms/
url :
	 https://downloads.sourceforge.net/project/libmms/libmms/0.6.4/libmms-0.6.4.tar.gz
description :
	 Library for parsing mms:// and mmsh:// network streams
build_deps :
	 pkg-config
link_deps :
	 glib
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.append "LDFLAGS", "-liconv"
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
