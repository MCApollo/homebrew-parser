name :
	 Quantlib
homepage :
	 https://www.quantlib.org/
url :
	 https://dl.bintray.com/quantlib/releases/QuantLib-1.13.tar.gz
description :
	 Library for quantitative finance
build_deps :
link_deps :
	 boost
conflicts :
patches :
EOF_patch :
install :
	 (buildpath/"QuantLib").install buildpath.children if build.stable?
	 cd "QuantLib" do
	 system "./autogen.sh" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--with-lispdir=#{elisp}",
	 "--enable-intraday"
	 system "make", "install"
	 prefix.install_metafiles
	 end
