name :
	 Icecast
homepage :
	 https://icecast.org/
url :
	 https://downloads.xiph.org/releases/icecast/icecast-2.4.3.tar.gz
description :
	 Streaming MP3 audio server
build_deps :
	 pkg-config
link_deps :
	 libvorbis
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
	 (prefix+"var/log/icecast").mkpath
	 touch prefix+"var/log/icecast/error.log"
