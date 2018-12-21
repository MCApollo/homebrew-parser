name :
	 Jbigkit
homepage :
	 https://www.cl.cam.ac.uk/~mgk25/jbigkit/
url :
	 https://www.cl.cam.ac.uk/~mgk25/jbigkit/download/jbigkit-2.1.tar.gz
description :
	 JBIG1 data compression standard implementation
build_deps :
link_deps :
conflicts :
	 netpbm
patches :
EOF_patch :
install :
	 system "make", "CC=#{ENV.cc}", "CCFLAGS=#{ENV.cflags}"
	 cd "pbmtools" do
	 bin.install %w[pbmtojbg jbgtopbm pbmtojbg85 jbgtopbm85]
	 man1.install %w[pbmtojbg.1 jbgtopbm.1]
	 man5.install %w[pbm.5 pgm.5]
