name :
	 Ecl
homepage :
	 https://common-lisp.net/project/ecl/
url :
	 https://common-lisp.net/project/ecl/static/files/release/ecl-16.1.3.tgz
description :
	 Embeddable Common Lisp
build_deps :
link_deps :
	 bdw-gc
	 gmp
	 libffi
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 system "./configure", "--prefix=#{prefix}",
	 "--enable-threads=yes",
	 "--enable-boehm=system",
	 "--enable-gmp=system"
	 system "make"
	 system "make", "install"
