name :
	 Sdhash
homepage :
	 http://roussev.net/sdhash/sdhash.html
url :
	 http://roussev.net/sdhash/releases/packages/sdhash-3.1.tar.gz
description :
	 Tool for correlating binary blobs of data
build_deps :
link_deps :
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 inreplace "Makefile" do |s|
	 s.change_make_var! "LDFLAGS",
	 "-L. -L./external/stage/lib -lboost_regex -lboost_system -lboost_filesystem " \
	 "-lboost_program_options -lc -lm -lcrypto -lboost_thread -lpthread"
	 end
	 system "make", "boost"
	 system "make", "stream"
	 bin.install "sdhash"
	 man1.install Dir["man/*.1"]
