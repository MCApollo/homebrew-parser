name :
	 Gpa
homepage :
	 https://www.gnupg.org/related_software/gpa/
url :
	 https://gnupg.org/ftp/gcrypt/gpa/gpa-0.10.0.tar.bz2
description :
	 Graphical user interface for the GnuPG
build_deps :
	 pkg-config
link_deps :
	 desktop-file-utils
	 gpgme
	 gtk+
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
