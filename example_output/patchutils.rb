name :
	 Patchutils
homepage :
	 http://cyberelk.net/tim/software/patchutils/
url :
	 http://cyberelk.net/tim/data/patchutils/stable/patchutils-0.3.4.tar.xz
description :
	 Small collection of programs that operate on patch files
build_deps :
	 xmlto
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["XML_CATALOG_FILES"] = "#{etc}/xml/catalog" if build.head?
	 system "./bootstrap" if build.head?
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
	 system "make", "install"
