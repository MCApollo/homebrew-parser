name :
	 Wandio
homepage :
	 https://research.wand.net.nz/software/libwandio.php
url :
	 https://research.wand.net.nz/software/wandio/wandio-4.0.0.tar.gz
description :
	 Transparently read from and write to zip, bzip2, lzma or zstd archives
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
	 "--with-http",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
