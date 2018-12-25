name :
	 Pbzip2
homepage :
	 https://web.archive.org/web/20180226093549/compression.ca/pbzip2/
url :
	 https://launchpad.net/pbzip2/1.1/1.1.13/+download/pbzip2-1.1.13.tar.gz
description :
	 Parallel bzip2
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
	 system "make", "PREFIX=#{prefix}",
	 "CC=#{ENV.cxx}",
	 "CFLAGS=#{ENV.cflags}",
	 "PREFIX=#{prefix}",
	 "install"
