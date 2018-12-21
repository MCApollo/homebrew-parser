name :
	 Pcrexx
homepage :
	 https://www.daemon.de/PCRE
url :
	 https://www.daemon.de/idisk/Apps/pcre++/pcre++-0.9.5.tar.gz
description :
	 C++ wrapper for the Perl Compatible Regular Expressions
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
	 pcre
conflicts :
patches :
EOF_patch :
	 diff --git a/libpcre++/pcre++.h b/libpcre++/pcre++.h
	 index d80b387..21869fc 100644
	 --- a/libpcre++/pcre++.h
	 +++ b/libpcre++/pcre++.h
	 @@ -47,11 +47,11 @@
	 #include <map>
	 #include <stdexcept>
	 #include <iostream>
	 +#include <clocale>
	 extern "C" {
	 #include <pcre.h>
	 -  #include <locale.h>
	 }
	 namespace pcrepp {
install :
	 pcre = Formula["pcre"]
	 system "autoreconf", "-fvi"
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--with-pcre-lib=#{pcre.opt_lib}",
	 "--with-pcre-include=#{pcre.opt_include}"
	 system "make", "install"
	 mv man3/"Pcre.3", man3/"pcre++.3"
