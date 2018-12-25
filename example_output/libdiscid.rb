name :
	 Libdiscid
homepage :
	 https://musicbrainz.org/doc/libdiscid
url :
	 http://ftp.musicbrainz.org/pub/musicbrainz/libdiscid/libdiscid-0.6.2.tar.gz
description :
	 C library for creating MusicBrainz and freedb disc IDs
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
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
