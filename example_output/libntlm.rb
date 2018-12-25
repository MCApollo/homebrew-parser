name :
	 Libntlm
homepage :
	 https://www.nongnu.org/libntlm/
url :
	 https://www.nongnu.org/libntlm/releases/libntlm-1.4.tar.gz
description :
	 Implements Microsoft's NTLM authentication
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
