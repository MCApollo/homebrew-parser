name :
	 Yara
homepage :
	 https://github.com/VirusTotal/yara/
url :
	 https://github.com/VirusTotal/yara/archive/v3.8.1.tar.gz
description :
	 Malware identification and classification tool
build_deps :
	 autoconf
	 automake
	 libtool
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
	 system "./bootstrap.sh"
	 system "./configure", "--disable-silent-rules",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--enable-dotnet"
	 system "make", "install"
