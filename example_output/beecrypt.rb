name :
	 Beecrypt
homepage :
	 https://beecrypt.sourceforge.io
url :
	 https://downloads.sourceforge.net/project/beecrypt/beecrypt/4.2.1/beecrypt-4.2.1.tar.gz
description :
	 C/C++ cryptography library
build_deps :
	 libtool
link_deps :
conflicts :
patches :
EOF_patch :
	 --- include/beecrypt/c++/util/AbstractSet.h~	2009-06-17 13:05:55.000000000 +0200
	 +++ include/beecrypt/c++/util/AbstractSet.h	2012-06-03 17:45:55.229399461 +0200
	 @@ -56,7 +56,7 @@
	 if (c->size() != size())
	 return false;
	 -					return containsAll(*c);
	 +					return this->containsAll(*c);
	 }
	 return false;
	 }
install :
	 cp Dir["#{Formula["libtool"].opt_share}/libtool/*/config.{guess,sub}"], buildpath
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--disable-openmp",
	 "--without-java",
	 "--without-python"
	 system "make"
	 system "make", "check"
	 system "make", "install"
