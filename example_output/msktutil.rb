name :
	 Msktutil
homepage :
	 https://sourceforge.net/projects/msktutil/
url :
	 https://downloads.sourceforge.net/project/msktutil/msktutil-1.0.tar.bz2
description :
	 Active Directory keytab management
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
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make", "install"
