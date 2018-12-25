name :
	 Mupdf
homepage :
	 https://mupdf.com/
url :
	 https://mupdf.com/downloads/archive/mupdf-1.14.0-source.tar.gz
description :
	 Lightweight PDF and XPS viewer
build_deps :
link_deps :
	 openssl
	 :x11
optional_deps :
conflicts :
	 mupdf-tools
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make", "install",
	 "build=release",
	 "verbose=yes",
	 "CC=#{ENV.cc}",
	 "prefix=#{prefix}"
	 bin.install_symlink bin/"mutool" => "mudraw"
	 man1.install_symlink man1/"mutool.1" => "mudraw.1"
