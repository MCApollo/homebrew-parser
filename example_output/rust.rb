name :
	 Rust
homepage :
	 https://www.rust-lang.org/
url :
	 https://static.rust-lang.org/dist/rustc-1.31.0-src.tar.gz
description :
	 Safe, concurrent, practical language
build_deps :
	 cmake
link_deps :
	 libssh2
	 openssl
	 pkg-config
conflicts :
patches :
EOF_patch :
install :
	 ENV["MACOSX_DEPLOYMENT_TARGET"] = MacOS.version
	 ENV["OPENSSL_DIR"] = Formula["openssl"].opt_prefix
	 ENV["SDKROOT"] = MacOS.sdk_path
	 args = ["--prefix=#{prefix}"]
	 args << "--disable-rpath" if build.head?
	 if build.head?
	 args << "--release-channel=nightly"
	 else
	 args << "--release-channel=stable"
	 Dir["#{lib}/rustlib/**/*.dylib"].each do |dylib|
	 chmod 0664, dylib
	 MachO::Tools.change_dylib_id(dylib, "@rpath/#{File.basename(dylib)}")
	 chmod 0444, dylib
	 end
