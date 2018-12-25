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
optional_deps :
conflicts :
resource :
	 ['hts_engine API', 'voice', 'mei']
	 ['https://downloads.sourceforge.net/project/hts-engine/hts_engine%20API/hts_engine_API-1.10/hts_engine_API-1.10.tar.gz', 'https://downloads.sourceforge.net/project/open-jtalk/HTS%20voice/hts_voice_nitech_jp_atr503_m001-1.05/hts_voice_nitech_jp_atr503_m001-1.05.tar.gz', 'https://downloads.sourceforge.net/project/mmdagent/MMDAgent_Example/MMDAgent_Example-1.7/MMDAgent_Example-1.7.zip']
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
	 end
	 system "make", "install"
	 resource("voice").stage do
	 (prefix/"voice/m100").install Dir["*"]
	 end
	 resource("mei").stage do
	 (prefix/"voice").install "Voice/mei"
	 end
