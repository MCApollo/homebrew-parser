name :
	 Tenyr
homepage :
	 http://tenyr.info/
url :
	 https://github.com/kulp/tenyr/archive/v0.9.6.tar.gz
description :
	 32-bit computing environment (including simulated CPU)
build_deps :
	 bison
	 pkg-config
link_deps :
	 sdl2_image
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make", "BISON=#{Formula["bison"].opt_bin}/bison",
	 "JIT=0", "BUILDDIR=build/homebrew"
	 pkgshare.install "rsrc", "plugins"
	 cd "build/homebrew" do
	 bin.install "tsim", "tas", "tld"
	 lib.install Dir["*.dylib"]
	 end
