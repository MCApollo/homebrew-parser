name :
	 Postmark
homepage :
	 https://packages.debian.org/sid/postmark
url :
	 https://mirrors.ocf.berkeley.edu/debian/pool/main/p/postmark/postmark_1.53.orig.tar.gz
description :
	 File system benchmark from NetApp
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
	 system ENV.cc, "-o", "postmark", "postmark-#{version}.c"
	 bin.install "postmark"
	 man1.install "postmark.1"
