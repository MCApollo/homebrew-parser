name :
	 Md5deep
homepage :
	 https://github.com/jessek/hashdeep
url :
	 https://github.com/jessek/hashdeep/archive/release-4.4.tar.gz
description :
	 Recursively compute digests on files/directories
build_deps :
	 autoconf
	 automake
link_deps :
conflicts :
patches :
	 https://github.com/jessek/hashdeep/commit/8776134.patch?full_index=1
EOF_patch :
install :
	 system "sh", "bootstrap.sh"
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
