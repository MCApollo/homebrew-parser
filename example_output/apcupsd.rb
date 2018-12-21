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
conflicts :
patches :
EOF_patch :
install :
	 sysconfdir = etc/name
	 cd "src/apcagent" do
	 inreplace "Makefile", "Applications", prefix
