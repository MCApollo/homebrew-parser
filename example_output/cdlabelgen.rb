name :
	 Cdlabelgen
homepage :
	 https://www.aczoom.com/tools/cdinsert/
url :
	 https://www.aczoom.com/pub/tools/cdlabelgen-4.3.0.tgz
description :
	 CD/DVD inserts and envelopes
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
	 man1.mkpath
	 system "make", "install", "BASE_DIR=#{prefix}"
