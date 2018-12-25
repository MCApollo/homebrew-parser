name :
	 Pick
homepage :
	 https://github.com/calleerlandsson/pick
url :
	 https://github.com/calleerlandsson/pick/releases/download/v2.0.2/pick-2.0.2.tar.gz
description :
	 Utility to choose one option from a set of choices
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
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "check"
	 system "make", "install"
