name :
	 GhcAT82
homepage :
	 https://haskell.org/ghc/
url :
	 https://downloads.haskell.org/~ghc/8.2.2/ghc-8.2.2-src.tar.xz
description :
	 Glorious Glasgow Haskell Compilation System
build_deps :
	 sphinx-doc
link_deps :
	 python
	 :macos
conflicts :
patches :
EOF_patch :
install :
	 ENV["CC"] = ENV.cc
	 ENV["LD"] = "ld"
	 ENV["HOMEBREW_OPTFLAGS"] = "-march=#{Hardware.oldest_cpu}" unless build.bottle?
	 gmp = libexec/"integer-gmp"
	 ENV["MPN_PATH"] = "x86_64/fastsse x86_64/core2 x86_64 generic" if build.bottle?
	 resource("gmp").stage do
	 system "./configure", "--prefix=#{gmp}", "--with-pic", "--disable-shared"
	 system "make"
	 system "make", "check"
	 ENV.deparallelize { system "make", "install" }
	 end
	 args = ["--with-gmp-includes=#{gmp}/include",
	 "--with-gmp-libraries=#{gmp}/lib"]
	 if DevelopmentTools.clang_build_version >= 703 && DevelopmentTools.clang_build_version < 800
	 args << "--with-nm=#{`xcrun --find nm-classic`.chomp}"
	 end
	 resource("binary").stage do
	 binary = buildpath/"binary"
	 system "./configure", "--prefix=#{binary}", *args
	 ENV.deparallelize { system "make", "install" }
	 ENV.prepend_path "PATH", binary/"bin"
	 end
	 system "./configure", "--prefix=#{prefix}", *args
	 system "make"
	 if build.bottle?
	 resource("testsuite").stage { buildpath.install Dir["*"] }
	 cd "testsuite" do
	 system "make", "clean"
	 system "make", "CLEANUP=1", "THREADS=#{ENV.make_jobs}", "fast"
	 end
	 end
	 ENV.deparallelize { system "make", "install" }
	 Dir.glob(lib/"*/package.conf.d/package.cache") { |f| rm f }
	 system "#{bin}/ghc-pkg", "recache"
