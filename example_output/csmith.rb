name :
	 Csmith
homepage :
	 https://embed.cs.utah.edu/csmith/
url :
	 https://embed.cs.utah.edu/csmith/csmith-2.3.0.tar.gz
description :
	 Generates random C programs conforming to the C99 standard
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
	 mv "#{bin}/compiler_test.in", share
	 (include/"csmith-#{version}/runtime").install Dir["runtime/*.h"]
