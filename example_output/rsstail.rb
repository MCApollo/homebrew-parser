name :
	 Rsstail
homepage :
	 https://www.vanheusden.com/rsstail/
url :
	 https://www.vanheusden.com/rsstail/rsstail-2.1.tgz
description :
	 Monitors an RSS feed and emits new entries when detected
build_deps :
link_deps :
	 libmrss
optional_deps :
conflicts :
resource :
	 ['libiconv_hook']
	 ['https://www.mirrorservice.org/sites/archive.ubuntu.com/ubuntu/pool/universe/liba/libapache-mod-encoding/libapache-mod-encoding_0.0.20021209.orig.tar.gz']
patches :
EOF_patch :
install :
	 (buildpath/"libiconv_hook").install resource("libiconv_hook")
	 cd "libiconv_hook/lib" do
	 system "./configure", "--disable-shared"
	 system "make"
	 end
	 system "make", "LDFLAGS=-liconv -liconv_hook -lmrss -L#{buildpath}/libiconv_hook/lib/.libs"
	 man1.install "rsstail.1"
	 bin.install "rsstail"
