name :
	 UserspaceRcu
homepage :
	 https://lttng.org/urcu
url :
	 https://www.lttng.org/files/urcu/userspace-rcu-0.10.1.tar.bz2
description :
	 Library for userspace RCU (read-copy-update)
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 args = ["--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"]
	 args << "--build=#{Hardware::CPU.arch_64_bit}" if MacOS.prefer_64_bit?
	 system "./configure", *args
	 system "make"
	 system "make", "install"
