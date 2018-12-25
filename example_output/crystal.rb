name :
	 Crystal
homepage :
	 https://crystal-lang.org/
url :
	 https://github.com/crystal-lang/crystal/archive/0.27.0.tar.gz
description :
	 Fast and statically typed, compiled language with Ruby-like syntax
build_deps :
	 libatomic_ops
	 pkg-config
link_deps :
	 bdw-gc
	 gmp
	 libevent
	 libyaml
	 llvm@6
	 pcre
optional_deps :
conflicts :
resource :
	 ['shards', 'boot']
	 ['https://github.com/crystal-lang/shards/archive/v0.8.1.tar.gz', 'https://github.com/crystal-lang/crystal/releases/download/0.26.1/crystal-0.26.1-1-darwin-x86_64.tar.gz']
patches :
EOF_patch :
install :
	 (buildpath/"boot").install resource("boot")
	 if build.head?
	 ENV["CRYSTAL_CONFIG_BUILD_COMMIT"] = Utils.popen_read("git rev-parse --short HEAD").strip
	 end
	 ENV["CRYSTAL_CONFIG_PATH"] = prefix/"src:lib"
	 ENV.append_path "PATH", "boot/bin"
	 system "make", "deps"
	 (buildpath/".build").mkpath
	 system "bin/crystal", "build",
	 "-D", "without_openssl",
	 "-D", "without_zlib",
	 "-o", ".build/crystal",
	 "src/compiler/crystal.cr",
	 "--release", "--no-debug"
	 resource("shards").stage do
	 system buildpath/"bin/crystal", "build", "-o", buildpath/".build/shards", "src/shards.cr"
	 end
	 bin.install ".build/shards"
	 bin.install ".build/crystal"
	 prefix.install "src"
	 bash_completion.install "etc/completion.bash" => "crystal"
	 zsh_completion.install "etc/completion.zsh" => "_crystal"
