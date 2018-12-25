name :
	 Mosh
homepage :
	 https://mosh.org
url :
	 https://mosh.org/mosh-1.3.2.tar.gz
description :
	 Remote terminal application
build_deps :
	 pkg-config
link_deps :
	 tmux
	 protobuf
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.cxx11
	 inreplace "scripts/mosh.pl", "'mosh-client", "\'#{bin}/mosh-client"
	 system "./autogen.sh" if build.head?
	 system "./configure", "--prefix=#{prefix}", "--enable-completion"
	 system "make", "check" if build.bottle?
	 system "make", "install"
