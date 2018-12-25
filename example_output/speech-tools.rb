name :
	 SpeechTools
homepage :
	 http://festvox.org/docs/speech_tools-2.4.0/
url :
	 http://festvox.org/packed/festival/2.5/speech_tools-2.5.0-release.tar.gz
description :
	 C++ speech software library from the University of Edinburgh
build_deps :
link_deps :
optional_deps :
conflicts :
	 align
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 system "./configure"
	 system "make"
	 bin.install Dir["main/*"].select { |f| File.file?(f) && File.executable?(f) }
