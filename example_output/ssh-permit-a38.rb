name :
	 SshPermitA38
homepage :
	 https://github.com/ierror/ssh-permit-a38
url :
	 https://github.com/ierror/ssh-permit-a38/archive/v0.2.0.tar.gz
description :
	 Central management and deployment for SSH keys
build_deps :
	 cmake
	 rust
link_deps :
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 ENV["OPENSSL_DIR"] = Formula["openssl"].opt_prefix
	 system "cargo", "install", "--root", prefix, "--path", "."
