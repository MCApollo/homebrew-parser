name :
	 Abcde
homepage :
	 https://abcde.einval.com
url :
	 https://abcde.einval.com/download/abcde-2.9.2.tar.gz
description :
	 Better CD Encoder
build_deps :
link_deps :
	 cd-discid
	 cdrtools
	 flac
	 glyr
	 id3v2
	 lame
	 mkcue
	 vorbis-tools
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make", "install", "prefix=#{prefix}", "sysconfdir=#{etc}"
