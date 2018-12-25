name :
	 Recode
homepage :
	 https://github.com/pinard/Recode
url :
	 https://github.com/pinard/Recode/archive/v3.7-beta2.tar.gz
description :
	 Convert character set (charsets)
build_deps :
	 libtool
link_deps :
	 gettext
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.append "LDFLAGS", "-liconv"
	 ENV.append "LDFLAGS", "-lintl"
	 inreplace "src/recodext.h", "bool ignore : 2;", "bool ignore : 1;"
	 cp Dir["#{Formula["libtool"].opt_pkgshare}/*/config.{guess,sub}"], buildpath
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--without-included-gettext",
	 "--prefix=#{prefix}",
	 "--infodir=#{info}",
	 "--mandir=#{man}"
	 system "make", "install"
