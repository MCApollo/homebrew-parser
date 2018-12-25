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
optional_deps :
conflicts :
resource :
	 ['cargo', 'racer', 'racer', 'cargobootstrap']
	 ['https://github.com/rust-lang/cargo.git', 'https://github.com/racer-rust/racer/archive/2.0.14.tar.gz', 'https://github.com/racer-rust/racer.git', 'https://static.rust-lang.org/dist/2018-10-25/cargo-0.31.0-x86_64-apple-darwin.tar.gz']
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
	 end
	 system "./configure", *args
	 system "make"
	 system "make", "install"
	 resource("cargobootstrap").stage do
	 system "./install.sh", "--prefix=#{buildpath}/cargobootstrap"
	 end
	 ENV.prepend_path "PATH", buildpath/"cargobootstrap/bin"
	 resource("cargo").stage do
	 ENV["RUSTC"] = bin/"rustc"
	 system "cargo", "install", "--root", prefix, "--path", ".", "--features", "curl-sys/force-system-lib-on-osx"
	 end
	 resource("racer").stage do
	 ENV.prepend_path "PATH", bin
	 cargo_home = buildpath/"cargo_home"
	 cargo_home.mkpath
	 ENV["CARGO_HOME"] = cargo_home
	 system "cargo", "install", "--root", libexec, "--path", "."
	 (bin/"racer").write_env_script(libexec/"bin/racer", :RUST_SRC_PATH => pkgshare/"rust_src")
	 end
	 rm_rf Dir["src/{llvm,llvm-emscripten,test,librustdoc,etc/snapshot.pyc}"]
	 (pkgshare/"rust_src").install Dir["src/*"]
	 rm_rf prefix/"lib/rustlib/uninstall.sh"
	 rm_rf prefix/"lib/rustlib/install.log"
	 Dir["#{lib}/rustlib/**/*.dylib"].each do |dylib|
	 chmod 0664, dylib
	 MachO::Tools.change_dylib_id(dylib, "@rpath/#{File.basename(dylib)}")
	 chmod 0444, dylib
	 end
