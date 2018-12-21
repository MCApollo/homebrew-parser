name :
	 Flvstreamer
homepage :
	 https://www.nongnu.org/flvstreamer/
url :
	 https://download.savannah.gnu.org/releases/flvstreamer/source/flvstreamer-2.1c1.tar.gz
description :
	 Stream audio and video from flash & RTMP Servers
build_deps :
link_deps :
conflicts :
	 rtmpdump
patches :
EOF_patch :
install :
	 system "make", "posix"
	 bin.install "flvstreamer", "rtmpsrv", "rtmpsuck", "streams"
