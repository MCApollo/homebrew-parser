name :
	 Libfaketime
homepage :
	 https://github.com/wolfcw/libfaketime
url :
	 https://github.com/wolfcw/libfaketime/archive/v0.9.7.tar.gz
description :
	 Report faked system time to programs
build_deps :
link_deps :
	 coreutils
	 :macos
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make", "-C", "src", "-f", "Makefile.OSX", "PREFIX=#{prefix}"
	 bin.install "src/faketime"
	 (lib/"faketime").install "src/libfaketime.1.dylib"
	 man1.install "man/faketime.1"
