name :
	 Dnsdist
homepage :
	 https://www.dnsdist.org/
url :
	 https://downloads.powerdns.com/releases/dnsdist-1.3.2.tar.bz2
description :
	 Highly DNS-, DoS- and abuse-aware loadbalancer
build_deps :
	 boost
	 pkg-config
link_deps :
	 lua
conflicts :
patches :
EOF_patch :
install :
	 ENV["SDKROOT"] = MacOS.sdk_path if MacOS.version == :sierra
	 if MacOS.version == :high_sierra
	 sdk = MacOS::CLT.installed? ? "" : MacOS.sdk_path
	 ENV["LIBEDIT_CFLAGS"] = "-I#{sdk}/usr/include -I#{sdk}/usr/include/editline"
	 ENV["LIBEDIT_LIBS"] = "-L/usr/lib -ledit -lcurses"
	 end
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--without-net-snmp",
	 "--sysconfdir=#{etc}/dnsdist"
	 system "make", "install"
