name :
	 Nacl
homepage :
	 https://nacl.cr.yp.to/
url :
	 https://hyperelliptic.org/nacl/nacl-20110221.tar.bz2
description :
	 Network communication, encryption, decryption, signatures library
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 inreplace "do" do |s|
	 s.gsub! 'exec >"$top/log"', 'exec | tee "$top/log"'
	 s.gsub! /^shorthostname=`.*$/, "shorthostname=brew"
	 end
	 system "./do"
	 #
	 archstr = Hardware::CPU.is_64_bit? ? "amd64" : "x86"
	 include.install Dir["build/brew/include/#{archstr}/crypto_*.h"]
	 include.install "build/brew/include/#{archstr}/randombytes.h"
	 nacl_libdir = "build/brew/lib/#{archstr}"
	 system "ar", "-r", "#{nacl_libdir}/libnacl.a", "#{nacl_libdir}/randombytes.o"
	 lib.install "#{nacl_libdir}/libnacl.a"
