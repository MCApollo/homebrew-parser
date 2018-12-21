name :
	 Md5sha1sum
homepage :
	 http://microbrew.org/tools/md5sha1sum/
url :
	 http://microbrew.org/tools/md5sha1sum/md5sha1sum-0.9.5.tar.gz
description :
	 Hash utilities
build_deps :
link_deps :
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 openssl = Formula["openssl"]
	 ENV["SSLINCPATH"] = openssl.opt_include
	 ENV["SSLLIBPATH"] = openssl.opt_lib
	 system "./configure", "--prefix=#{prefix}"
	 system "make"
	 bin.install "md5sum"
	 bin.install_symlink bin/"md5sum" => "sha1sum"
	 bin.install_symlink bin/"md5sum" => "ripemd160sum"
