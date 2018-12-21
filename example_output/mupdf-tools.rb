name :
	 MupdfTools
homepage :
	 https://mupdf.com/
url :
	 https://mupdf.com/downloads/archive/mupdf-1.14.0-source.tar.gz
description :
	 Lightweight PDF and XPS viewer
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "install",
	 "build=release",
	 "verbose=yes",
	 "HAVE_X11=no",
	 "HAVE_GLUT=no",
	 "CC=#{ENV.cc}",
	 "prefix=#{prefix}"
	 bin.install_symlink bin/"mutool" => "mudraw"
	 man1.install_symlink man1/"mutool.1" => "mudraw.1"
