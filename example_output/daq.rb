name :
	 Daq
homepage :
	 https://www.snort.org/
url :
	 https://www.mirrorservice.org/sites/distfiles.macports.org/daq/daq-2.0.6.tar.gz
description :
	 Network intrusion prevention and detection system
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/b345dac/daq/patch-pcap-version.diff
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
