name :
	 Kyua
homepage :
	 https://github.com/jmmv/kyua
url :
	 https://github.com/jmmv/kyua/releases/download/kyua-0.13/kyua-0.13.tar.gz
description :
	 Testing framework for infrastructure software
build_deps :
	 pkg-config
link_deps :
	 atf
	 lua
	 lutok
	 sqlite
conflicts :
patches :
EOF_patch :
install :
	 ENV.append "CPPFLAGS", "-I#{Formula["lua"].opt_include}/lua"
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make"
	 ENV.deparallelize
	 system "make", "install"
