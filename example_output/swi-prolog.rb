name :
	 SwiProlog
homepage :
	 http://www.swi-prolog.org/
url :
	 http://www.swi-prolog.org/download/stable/src/swipl-7.6.4.tar.gz
description :
	 ISO/Edinburgh-style Prolog interpreter
build_deps :
	 pkg-config
link_deps :
	 gmp
	 openssl
	 readline
	 libarchive
	 :x11
	 jpeg
conflicts :
patches :
EOF_patch :
install :
	 if build.with? "libarchive"
	 ENV["ARPREFIX"] = Formula["libarchive"].opt_prefix
	 else
	 ENV.append "DISABLE_PKGS", "archive"
