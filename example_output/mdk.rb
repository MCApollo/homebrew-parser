name :
	 Mdk
homepage :
	 https://www.gnu.org/software/mdk/mdk.html
url :
	 https://ftp.gnu.org/gnu/mdk/v1.2.9/mdk-1.2.9.tar.gz
description :
	 GNU MIX development kit
build_deps :
	 intltool
	 pkg-config
link_deps :
	 flex
	 glib
	 gtk+
	 guile
	 libglade
	 readline
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
