name :
	 RustupInit
homepage :
	 https://github.com/rust-lang/rustup.rs
url :
	 https://github.com/rust-lang/rustup.rs/archive/1.16.0.tar.gz
description :
	 The Rust toolchain installer
build_deps :
	 rust
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://github.com/rust-lang/rustup.rs/pull/1521/commits/ebbfced7ee4aeb5be4c775f8f85e351093d5818f.diff?full_index=1
EOF_patch :
install :
	 cargo_home = buildpath/"cargo_home"
	 cargo_home.mkpath
	 ENV["CARGO_HOME"] = cargo_home
	 system "cargo", "install", "--root", prefix, "--path", ".",
	 "--features", "no-self-update"
