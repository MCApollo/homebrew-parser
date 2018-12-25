name :
	 Dex
homepage :
	 https://github.com/tihirvon/dex
url :
	 https://github.com/tihirvon/dex/archive/v1.0.tar.gz
description :
	 Dextrous text editor
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
	 args = ["prefix=#{prefix}",
	 "CC=#{ENV.cc}",
	 "HOST_CC=#{ENV.cc}"]
	 args << "VERSION=#{version}" if build.head?
	 system "make", "install", *args
