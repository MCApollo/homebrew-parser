name :
	 Getxbook
homepage :
	 https://njw.name/getxbook
url :
	 https://njw.name/getxbook/getxbook-1.2.tar.xz
description :
	 Tools to download ebooks from various sources
build_deps :
link_deps :
	 openssl
	 tcl-tk
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = %W[CC=#{ENV.cc} PREFIX=#{prefix}]
	 args << "install" if build.with?("gui")
	 system "make", *args
	 bin.install "getgbook", "getabook", "getbnbook"
