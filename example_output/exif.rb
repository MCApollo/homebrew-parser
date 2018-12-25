name :
	 Exif
homepage :
	 https://libexif.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/libexif/exif/0.6.21/exif-0.6.21.tar.gz
description :
	 Read, write, modify, and display EXIF data on the command-line
build_deps :
	 pkg-config
link_deps :
	 libexif
	 popt
optional_deps :
	 gettext
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = %W[
	 --prefix=#{prefix}
	 --disable-dependency-tracking
	 --disable-silent-rules
	 ]
	 args << "--disable-nls" if build.without? "gettext"
	 system "./configure", *args
	 system "make", "install"
