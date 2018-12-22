name :
	 Memtester
homepage :
	 http://pyropus.ca/software/memtester/
url :
	 http://pyropus.ca/software/memtester/old-versions/memtester-4.3.0.tar.gz
description :
	 Utility for testing the memory subsystem
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 inreplace "Makefile" do |s|
	 s.change_make_var! "INSTALLPATH", prefix
	 s.gsub! "man/man8", "share/man/man8"
	 end
	 inreplace "conf-ld", " -s", ""
	 system "make", "install"
