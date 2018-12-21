name :
	 Badtouch
homepage :
	 https://github.com/kpcyrd/badtouch
url :
	 https://github.com/kpcyrd/badtouch/archive/v0.6.1.tar.gz
description :
	 Scriptable network authentication cracker
build_deps :
	 rust
link_deps :
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 ENV["OPENSSL_DIR"] = Formula["openssl"].opt_prefix
	 system "cargo", "install", "--root", prefix, "--path", "."
	 man1.install "docs/badtouch.1"
