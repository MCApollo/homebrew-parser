name :
	 Simh
homepage :
	 http://simh.trailing-edge.com/
url :
	 http://simh.trailing-edge.com/sources/simhv39-0.zip
description :
	 Portable, multi-system simulator
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV.deparallelize unless build.head?
	 inreplace "makefile", "GCC = gcc", "GCC = #{ENV.cc}"
	 inreplace "makefile", "CFLAGS_O = -O2", "CFLAGS_O = #{ENV.cflags}"
	 system "make", "USE_NETWORK=1", "all"
	 bin.install Dir["BIN/*"]
	 Dir["**/*.txt"].each do |f|
	 (doc/File.dirname(f)).install f
	 end
	 (pkgshare/"vax").install Dir["VAX/*.{bin,exe}"]
