name :
	 Apcupsd
homepage :
	 http://www.apcupsd.org
url :
	 https://downloads.sourceforge.net/project/apcupsd/apcupsd%20-%20Stable/3.14.14/apcupsd-3.14.14.tar.gz
description :
	 Daemon for controlling APC UPSes
build_deps :
link_deps :
	 gd
	 libusb-compat
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 sysconfdir = etc/name
	 cd "src/apcagent" do
	 inreplace "Makefile", "Applications", prefix
	 end
	 cd "platforms/darwin" do
	 inreplace "Makefile", "/Library/LaunchDaemons", "#{prefix}/Library/LaunchDaemons"
	 inreplace "Makefile", "/System/Library/Extensions", kext_prefix
	 inreplace "apcupsd-start.in", "/etc/apcupsd", sysconfdir
	 inreplace "org.apcupsd.apcupsd.plist.in", "/etc/apcupsd", sysconfdir
	 inreplace "Makefile", /.*apcupsd-uninstall.*/, ""
	 end
	 system "./configure", "--prefix=#{prefix}",
	 "--sbindir=#{sbin}",
	 "--sysconfdir=#{sysconfdir}",
	 "--enable-cgi", "--with-cgi-bin=#{sysconfdir}",
	 "--enable-usb", "--enable-modbus-usb"
	 system "make", "install"
