name :
	 Ucon64
homepage :
	 https://ucon64.sourceforge.io/
url :
	 https://downloads.sourceforge.net/ucon64/ucon64-2.1.0-src.tar.gz
description :
	 ROM backup tool and emulator's Swiss Army knife program
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 ['super_bat_puncher_demo']
	 ['http://morphcat.de/superbatpuncher/Super%20Bat%20Puncher%20Demo.zip']
patches :
EOF_patch :
install :
	 inreplace "src/ucon64_misc.c", 'PROPERTY_MODE_DIR ("ucon64") "discmage.dylib"',
	 "\"#{opt_prefix}/libexec/libdiscmage.dylib\""
	 cd "src" do
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make"
	 bin.install "ucon64"
	 libexec.install "libdiscmage/discmage.so" => "libdiscmage.dylib"
	 end
