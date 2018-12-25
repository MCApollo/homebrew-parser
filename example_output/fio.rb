name :
	 Fio
homepage :
	 https://github.com/axboe/fio
url :
	 https://github.com/axboe/fio/archive/fio-3.12.tar.gz
description :
	 I/O benchmark and stress test
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
	 system "./configure"
	 system "make", "prefix=#{prefix}",
	 "mandir=#{man}",
	 "sharedir=#{share}",
	 "CC=#{ENV.cc}",
	 "V=true",
	 "install"
