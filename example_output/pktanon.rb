name :
	 Pktanon
homepage :
	 https://www.tm.uka.de/software/pktanon/index.html
url :
	 https://www.tm.uka.de/software/pktanon/download/pktanon-1.4.0-dev.tar.gz
description :
	 Packet trace anonymization
build_deps :
link_deps :
	 boost
	 xerces-c
conflicts :
patches :
EOF_patch :
install :
	 inreplace "src/Timer.cpp", %Q(#include "Timer.h"\r\n),
	 %Q(#include "Timer.h"\r\n#include "unistd.h"\r\n)
	 ENV["LIBS"] = "-lboost_system-mt"
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
	 system "make", "install"
