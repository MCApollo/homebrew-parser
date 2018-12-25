name :
	 Hmmer
homepage :
	 http://hmmer.org/
url :
	 http://eddylab.org/software/hmmer/hmmer-3.2.1.tar.gz
description :
	 Build profile HMMs and scan against sequence databases
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
	 doc.install "Userguide.pdf", "tutorial"
