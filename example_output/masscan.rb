name :
	 Masscan
homepage :
	 https://github.com/robertdavidgraham/masscan/
url :
	 https://github.com/robertdavidgraham/masscan/archive/1.0.5.tar.gz
description :
	 TCP port scanner, scans entire Internet in under 5 minutes
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 if MacOS.version == :el_capitan && MacOS::Xcode.installed? && MacOS::Xcode.version >= "8.0"
	 inreplace "src/pixie-timer.c", "#elif defined(CLOCK_MONOTONIC)", "#elif defined(NOT_A_MACRO)"
