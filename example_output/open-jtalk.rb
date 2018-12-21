name :
	 OpenJtalk
homepage :
	 https://open-jtalk.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/open-jtalk/Open%20JTalk/open_jtalk-1.10/open_jtalk-1.10.tar.gz
description :
	 Japanese text-to-speech system
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 resource("hts_engine API").stage do
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
