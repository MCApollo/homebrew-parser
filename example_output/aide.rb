name :
	 Aide
homepage :
	 https://aide.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/aide/aide/0.16/aide-0.16.tar.gz
description :
	 File and directory integrity checker
build_deps :
link_deps :
	 libgcrypt
	 libgpg-error
	 pcre
conflicts :
patches :
EOF_patch :
install :
	 system "sh", "./autogen.sh" if build.head?
	 system "./configure", "--disable-lfs",
	 "--disable-static",
	 "--with-curl",
	 "--with-zlib",
	 "--sysconfdir=#{etc}",
	 "--prefix=#{prefix}"
	 system "make", "install"
