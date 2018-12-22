name :
	 Pioneers
homepage :
	 https://pio.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/pio/Source/pioneers-15.5.tar.gz
description :
	 Settlers of Catan clone
build_deps :
	 intltool
	 itstool
	 pkg-config
link_deps :
	 gettext
	 gtk+3
	 librsvg
conflicts :
patches :
EOF_patch :
install :
	 inreplace "Makefile.in", /\becho/, "/bin/echo"
	 inreplace Dir["configure{,.ac}"] do |s|
	 s.gsub!(/ -Wl\,--as-needed/, "")
	 s.gsub!(/ -Wl,-z,(relro|now)/, "")
	 end
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
