name :
	 Sccache
homepage :
	 https://github.com/mozilla/sccache
url :
	 https://github.com/mozilla/sccache/archive/0.2.7.tar.gz
description :
	 Used as a compiler wrapper and avoids compilation when possible
build_deps :
	 rust
link_deps :
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 ENV["OPENSSL_DIR"] = Formula["openssl"].opt_prefix
	 system "cargo", "install", "--root", prefix, "--path", ".",
	 "--features", "all"
