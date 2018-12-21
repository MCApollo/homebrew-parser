name :
	 Mafft
homepage :
	 https://mafft.cbrc.jp/alignment/software/
url :
	 https://mafft.cbrc.jp/alignment/software/mafft-7.407-with-extensions-src.tgz
description :
	 Multiple alignments with fast Fourier transforms
build_deps :
link_deps :
	 :macos
conflicts :
patches :
EOF_patch :
install :
	 make_args = %W[CC=#{ENV.cc} CXX=#{ENV.cxx} PREFIX=#{prefix} install]
	 system "make", "-C", "core", *make_args
	 system "make", "-C", "extensions", *make_args
