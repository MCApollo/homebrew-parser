name :
	 Itex2mml
homepage :
	 https://golem.ph.utexas.edu/~distler/blog/itex2MML.html
url :
	 https://golem.ph.utexas.edu/~distler/blog/files/itexToMML-1.5.7.tar.gz
description :
	 Text filter to convert itex equations to MathML
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 bin.mkpath
	 cd "itex-src" do
	 system "make"
	 system "make", "install", "prefix=#{prefix}", "BINDIR=#{bin}"
