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
conflicts :
patches :
EOF_patch :
install :
	 (buildpath/"libiconv_hook").install resource("libiconv_hook")
	 cd "libiconv_hook/lib" do
	 system "./configure", "--disable-shared"
	 system "make"
