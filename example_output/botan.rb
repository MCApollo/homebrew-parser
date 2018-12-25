name :
	 Botan
homepage :
	 https://botan.randombit.net/
url :
	 https://botan.randombit.net/releases/Botan-2.8.0.tgz
description :
	 Cryptographic algorithms and formats library in C++
build_deps :
	 pkg-config
link_deps :
	 openssl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.cxx11
	 args = %W[
	 --prefix=#{prefix}
	 --docdir=share/doc
	 --cpu=#{MacOS.preferred_arch}
	 --cc=#{ENV.compiler}
	 --os=darwin
	 --with-openssl
	 --with-zlib
	 --with-bzip2
	 ]
	 system "./configure.py", *args
	 system "make", "install"
