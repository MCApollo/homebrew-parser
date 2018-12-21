name :
	 CenterIm
homepage :
	 https://www.centerim.org/index.php/Main_Page
url :
	 https://www.centerim.org/download/releases/centerim-4.22.10.tar.gz
description :
	 Text-mode multi-protocol instant messaging client
build_deps :
	 pkg-config
link_deps :
	 gettext
	 openssl
conflicts :
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/677cb38/center-im/patch-libjabber_jconn.c.diff
EOF_patch :
	 diff --git a/libicq2000/libicq2000/sigslot.h b/libicq2000/libicq2000/sigslot.h
	 index b7509c0..024774f 100644
	 --- a/libicq2000/libicq2000/sigslot.h
	 +++ b/libicq2000/libicq2000/sigslot.h
	 @@ -82,6 +82,7 @@
	 #ifndef SIGSLOT_H__
	 #define SIGSLOT_H__
	 +#include <cstdlib>
	 #include <set>
	 #include <list>
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--disable-msn",
	 "--with-openssl=#{Formula["openssl"].opt_prefix}"
	 system "make", "install"
	 inreplace bin/"cimformathistory", "/bin/gawk", "/usr/bin/awk"
