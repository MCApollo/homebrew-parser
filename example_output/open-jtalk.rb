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
	 end
	 system "./configure", "--with-hts-engine-header-path=#{include}",
	 "--with-hts-engine-library-path=#{lib}",
	 "--with-charset=UTF-8",
	 "--prefix=#{prefix}"
	 if MacOS.version <= :mavericks
	 inreplace "config.status", "-finput-charset=UTF-8 -fexec-charset=UTF-8", ""
