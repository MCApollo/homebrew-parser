name :
	 Netpbm
homepage :
	 https://netpbm.sourceforge.io/
url :
	 http://svn.code.sf.net/p/netpbm/code/stable
description :
	 Image manipulation
build_deps :
link_deps :
	 jasper
	 jpeg
	 libpng
	 libtiff
optional_deps :
conflicts :
	 jbigkit
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 if MacOS.version == :sierra || MacOS.version == :el_capitan
	 ENV["SDKROOT"] = MacOS.sdk_path
	 end
	 cp "config.mk.in", "config.mk"
	 inreplace "config.mk" do |s|
	 s.remove_make_var! "CC"
	 s.change_make_var! "CFLAGS_SHLIB", "-fno-common"
	 s.change_make_var! "NETPBMLIBTYPE", "dylib"
	 s.change_make_var! "NETPBMLIBSUFFIX", "dylib"
	 s.change_make_var! "LDSHLIB", "--shared -o $(SONAME)"
	 s.change_make_var! "TIFFLIB", "-ltiff"
	 s.change_make_var! "JPEGLIB", "-ljpeg"
	 s.change_make_var! "PNGLIB", "-lpng"
	 s.change_make_var! "ZLIB", "-lz"
	 s.change_make_var! "JASPERLIB", "-ljasper"
	 s.change_make_var! "JASPERHDR_DIR", "#{Formula["jasper"].opt_include}/jasper"
	 end
	 ENV.deparallelize
	 system "make"
	 system "make", "package", "pkgdir=#{buildpath}/stage"
	 cd "stage" do
	 inreplace "pkgconfig_template" do |s|
	 s.gsub! "@VERSION@", File.read("VERSION").sub("Netpbm ", "").chomp
	 s.gsub! "@LINKDIR@", lib
	 s.gsub! "@INCLUDEDIR@", include
	 end
	 prefix.install %w[bin include lib misc]
	 man1.install Dir["man/man1/*.1"]
	 man5.install Dir["man/man5/*.5"]
	 lib.install Dir["link/*.a"], Dir["link/*.dylib"]
	 (lib/"pkgconfig").install "pkgconfig_template" => "netpbm.pc"
	 end
	 (bin/"doc.url").unlink
