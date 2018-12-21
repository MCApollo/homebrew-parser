name :
	 Mp4v2
homepage :
	 https://code.google.com/archive/p/mp4v2/
url :
	 https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/mp4v2/mp4v2-2.0.0.tar.bz2
description :
	 Read, create, and modify MP4 files
build_deps :
link_deps :
conflicts :
	 bento4
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug", "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
	 system "make", "install-man"
