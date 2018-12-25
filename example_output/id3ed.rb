name :
	 Id3ed
homepage :
	 http://code.fluffytapeworm.com/projects/id3ed
url :
	 http://code.fluffytapeworm.com/projects/id3ed/id3ed-1.10.4.tar.gz
description :
	 ID3 tag editor for MP3 files
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
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--bindir=#{bin}/",
	 "--mandir=#{man1}"
	 bin.mkpath
	 man1.mkpath
	 system "make", "install"
