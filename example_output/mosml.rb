name :
	 Mosml
homepage :
	 http://mosml.org
url :
	 https://github.com/kfl/mosml/archive/ver-2.10.1.tar.gz
description :
	 Moscow ML
build_deps :
link_deps :
	 gmp
conflicts :
patches :
EOF_patch :
install :
	 cd "src" do
	 system "make", "PREFIX=#{prefix}", "CC=#{ENV.cc}", "world"
	 system "make", "PREFIX=#{prefix}", "CC=#{ENV.cc}", "install"
