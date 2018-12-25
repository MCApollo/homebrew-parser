name :
	 Cfengine
homepage :
	 https://cfengine.com/
url :
	 https://cfengine-package-repos.s3.amazonaws.com/tarballs/cfengine-3.12.0.tar.gz
description :
	 Help manage and understand IT infrastructure
build_deps :
link_deps :
	 libxml2
	 lmdb
	 openssl
	 pcre
optional_deps :
conflicts :
resource :
	 ['masterfiles']
	 ['https://cfengine-package-repos.s3.amazonaws.com/tarballs/cfengine-masterfiles-3.12.0.tar.gz']
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--with-workdir=#{var}/cfengine",
	 "--with-lmdb=#{Formula["lmdb"].opt_prefix}",
	 "--with-pcre=#{Formula["pcre"].opt_prefix}",
	 "--without-mysql",
	 "--without-postgresql"
	 system "make", "install"
	 (pkgshare/"CoreBase").install resource("masterfiles")
