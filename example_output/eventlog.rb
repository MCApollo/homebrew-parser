name :
	 Eventlog
homepage :
	 https://my.balabit.com/downloads/eventlog/
url :
	 https://my.balabit.com/downloads/syslog-ng/sources/3.4.3/source/eventlog_0.2.13.tar.gz
description :
	 Replacement for syslog API providing structure to messages
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
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
