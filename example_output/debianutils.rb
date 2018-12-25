name :
	 Debianutils
homepage :
	 https://packages.debian.org/sid/debianutils
url :
	 https://mirrors.ocf.berkeley.edu/debian/pool/main/d/debianutils/debianutils_4.8.6.tar.xz
description :
	 Miscellaneous utilities specific to Debian
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
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make"
	 bin.install "run-parts", "ischroot", "tempfile"
	 man1.install "ischroot.1", "tempfile.1"
	 man8.install "run-parts.8"
