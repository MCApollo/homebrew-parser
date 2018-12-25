name :
	 Rzip
homepage :
	 https://rzip.samba.org/
url :
	 https://rzip.samba.org/ftp/rzip/rzip-2.1.tar.gz
description :
	 File compression tool (like gzip or bzip2)
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
	 "--prefix=#{prefix}"
	 system "make", "install", "INSTALL_MAN=#{man}"
	 bin.install_symlink "rzip" => "runzip"
	 man1.install_symlink "rzip.1" => "runzip.1"
