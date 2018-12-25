name :
	 Ldapvi
homepage :
	 http://www.lichteblau.com/ldapvi/
url :
	 http://www.lichteblau.com/download/ldapvi-1.7.tar.gz
description :
	 Update LDAP entries with a text editor
build_deps :
	 pkg-config
	 xz
link_deps :
	 gettext
	 glib
	 openssl
	 popt
	 readline
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://mirrors.ocf.berkeley.edu/debian/pool/main/l/ldapvi/ldapvi_1.7-10.debian.tar.xz
EOF_patch :
install :
	 inreplace "ldapvi.c", "if (lstat(sasl, &st) == -1) return;",
	 "if (lstat(sasl, &st) == -1) return 0;"
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
