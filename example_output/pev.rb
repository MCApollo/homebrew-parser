name :
	 Pev
homepage :
	 https://pev.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/pev/pev-0.80/pev-0.80.tar.gz
description :
	 PE analysis toolkit
build_deps :
link_deps :
	 openssl
	 pcre
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 system "make", "prefix=#{prefix}", "CC=#{ENV.cc}"
	 system "make", "prefix=#{prefix}", "install"
