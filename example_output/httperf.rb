name :
	 Httperf
homepage :
	 https://github.com/httperf/httperf
url :
	 https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/httperf/httperf-0.9.0.tar.gz
description :
	 Tool for measuring webserver performance
build_deps :
link_deps :
	 openssl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "autoreconf", "-fvi" if build.head?
	 system "./configure", "--prefix=#{prefix}", "--disable-dependency-tracking"
	 system "make", "install"
