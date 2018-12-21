name :
	 Pkcrack
homepage :
	 https://www.unix-ag.uni-kl.de/~conrad/krypto/pkcrack.html
url :
	 https://www.unix-ag.uni-kl.de/~conrad/krypto/pkcrack/pkcrack-1.2.2.tar.gz
description :
	 Implementation of an algorithm for breaking the PkZip cipher
build_deps :
link_deps :
conflicts :
	 libextractor
patches :
EOF_patch :
install :
	 ENV.prepend "CPPFLAGS", "-I#{MacOS.sdk_path}/usr/include/malloc"
	 system "make", "-C", "src/"
	 bin.install Dir["src/*"].select { |f| File.executable? f }
