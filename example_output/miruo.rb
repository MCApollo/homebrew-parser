name :
	 Miruo
homepage :
	 https://github.com/KLab/miruo/
url :
	 https://github.com/KLab/miruo/archive/0.9.6b.tar.gz
description :
	 Pretty-print TCP session monitor/analyzer
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
	 system "./configure", "--prefix=#{prefix}", "--disable-dependency-tracking", "--with-libpcap=#{MacOS.sdk_path}/usr"
	 system "make", "install"
