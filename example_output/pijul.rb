name :
	 Pijul
homepage :
	 https://pijul.org
url :
	 https://pijul.org/releases/pijul-0.11.0.tar.gz
description :
	 Patch-based distributed version control system
build_deps :
	 pkg-config
	 rust
link_deps :
	 libsodium
	 openssl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["OPENSSL_DIR"] = Formula["openssl"].opt_prefix
	 cd "pijul" do
	 system "cargo", "install", "--root", prefix, "--path", "."
	 end
