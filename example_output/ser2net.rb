name :
	 Ser2net
homepage :
	 https://ser2net.sourceforge.io
url :
	 https://downloads.sourceforge.net/project/ser2net/ser2net/ser2net-3.5.tar.gz
description :
	 Allow network connections to serial ports
build_deps :
link_deps :
	 :macos
conflicts :
patches :
EOF_patch :
install :
	 inreplace "readconfig.c", "#include <values.h>", ""
	 inreplace ["ser2net.c", "ser2net.8"], "/etc/ser2net.conf", "#{etc}/ser2net.conf"
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make", "install", "LIBS=-lpthread"
	 etc.install "ser2net.conf"
