name :
	 Mp3cat
homepage :
	 https://web.archive.org/web/20150904105157/tomclegg.net/mp3cat
url :
	 https://web.archive.org/web/20150904105157/tomclegg.net/software/mp3cat-0.4.tar.gz
description :
	 Reads and writes mp3 files
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
	 system "make"
	 bin.install %w[mp3cat mp3log mp3log-conf mp3dirclean mp3http mp3stream-conf]
