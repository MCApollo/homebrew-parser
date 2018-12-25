name :
	 FlowTools
homepage :
	 https://code.google.com/archive/p/flow-tools/
url :
	 https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/flow-tools/flow-tools-0.68.5.1.tar.bz2
description :
	 Collect, send, process, and generate NetFlow data reports
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
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
