name :
	 Pike
homepage :
	 https://pike.lysator.liu.se/
url :
	 https://pike.lysator.liu.se/pub/pike/latest-stable/Pike-v8.0.702.tar.gz
description :
	 Dynamic programming language
build_deps :
link_deps :
	 gmp
	 libtiff
	 nettle
	 pcre
conflicts :
patches :
EOF_patch :
install :
	 ENV.append "CFLAGS", "-m64"
	 ENV.deparallelize
	 system "make", "CONFIGUREARGS='--prefix=#{prefix} --without-bundles --with-abi=64'"
	 system "make", "install",
	 "prefix=#{libexec}",
	 "exec_prefix=#{libexec}",
	 "share_prefix=#{libexec}/share",
	 "lib_prefix=#{libexec}/lib",
	 "man_prefix=#{libexec}/man",
	 "include_path=#{libexec}/include",
	 "INSTALLARGS=--traditional"
	 bin.install_symlink "#{libexec}/bin/pike"
	 share.install_symlink "#{libexec}/share/man"
