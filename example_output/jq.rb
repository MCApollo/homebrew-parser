name :
	 Jq
homepage :
	 https://stedolan.github.io/jq/
url :
	 https://github.com/stedolan/jq/releases/download/jq-1.6/jq-1.6.tar.gz
description :
	 Lightweight and flexible command-line JSON processor
build_deps :
link_deps :
	 oniguruma
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "autoreconf", "-iv" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--disable-maintainer-mode",
	 "--prefix=#{prefix}"
	 system "make", "install"
