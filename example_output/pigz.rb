name :
	 Pigz
homepage :
	 https://zlib.net/pigz/
url :
	 https://zlib.net/pigz/pigz-2.4.tar.gz
description :
	 Parallel gzip
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
	 if MacOS.version == :el_capitan && MacOS::Xcode.installed? && MacOS::Xcode.version >= "8.0"
	 inreplace "pigz.c", "ZLIB_VERNUM >= 0x1260", "ZLIB_VERNUM >= 0x9999"
	 end
	 system "make", "CC=#{ENV.cc}", "CFLAGS=#{ENV.cflags}"
	 bin.install "pigz", "unpigz"
	 man1.install "pigz.1"
	 man1.install_symlink "pigz.1" => "unpigz.1"
