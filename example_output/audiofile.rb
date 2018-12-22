name :
	 Audiofile
homepage :
	 https://audiofile.68k.org/
url :
	 https://audiofile.68k.org/audiofile-0.3.6.tar.gz
description :
	 Reads and writes many common audio file formats
build_deps :
link_deps :
conflicts :
patches :
	 https://mirrors.ocf.berkeley.edu/debian/pool/main/a/audiofile/audiofile_0.3.6-4.debian.tar.xz
	 https://mirrors.ocf.berkeley.edu/debian/pool/main/a/audiofile/audiofile_0.3.6-4.debian.tar.xz
EOF_patch :
install :
	 if build.head?
	 inreplace "autogen.sh", "libtool", "glibtool"
	 ENV["XML_CATALOG_FILES"] = "#{etc}/xml/catalog"
	 end
	 configure = build.head? ? "./autogen.sh" : "./configure"
	 args = ["--disable-dependency-tracking", "--prefix=#{prefix}"]
	 system configure, *args
	 system "make"
	 system "make", "install"
