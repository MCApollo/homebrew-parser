name :
	 Openrtsp
homepage :
	 http://www.live555.com/openRTSP
url :
	 http://www.live555.com/liveMedia/public/live.2018.10.17.tar.gz
description :
	 Command-line RTSP client
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./genMakefiles", "macosx"
	 system "make", "PREFIX=#{prefix}", "install"
	 libexec.install Dir.glob(bin/"test*")
