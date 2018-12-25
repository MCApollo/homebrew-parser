name :
	 Ipmiutil
homepage :
	 https://ipmiutil.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/ipmiutil/ipmiutil-2.9.5.tar.gz
description :
	 IPMI server management utility
build_deps :
link_deps :
	 openssl
optional_deps :
conflicts :
	 renameutils
resource :
	 []
	 []
patches :
EOF_patch :
	 diff -u ./configure.bak ./configure
	 --- ./configure.bak       2015-02-04 22:15:07.000000000 +0100
	 +++ ./configure   2015-02-04 22:16:18.000000000 +0100
	 @@ -20739,7 +20739,7 @@
	 echo "Detected HP-UX"
	 os=hpux
	 MD2_CFLAGS="-DSKIP_MD2"
	 -           OS_CFLAGS="-DHPUX"
	 +           OS_CFLAGS="-DHPUX $MD2_CFLAGS"
	 OS_LFLAGS=""
	 OS_DRIVERS="ipmimv.c"
	 drivers="open"
	 @@ -20748,7 +20748,7 @@
	 echo "Detected MacOSX"
	 os=macos
	 MD2_CFLAGS="-DSKIP_MD2"
	 -           OS_CFLAGS="-DMACOS"
	 +           OS_CFLAGS="-DMACOS $MD2_CFLAGS"
	 OS_LFLAGS=""
	 OS_DRIVERS="ipmimv.c ipmidir.c"
	 drivers="open direct"
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--enable-sha256",
	 "--enable-gpl"
	 system "make", "TMPDIR=#{ENV["TMPDIR"]}"
	 system "make", "prefix=/",
	 "DESTDIR=#{prefix}",
	 "varto=#{var}/lib/#{name}",
	 "initto=#{etc}/init.d",
	 "sysdto=#{prefix}/#{name}",
	 "install"
