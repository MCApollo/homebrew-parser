name :
	 Dvdrtools
homepage :
	 https://savannah.nongnu.org/projects/dvdrtools/
url :
	 https://savannah.nongnu.org/download/dvdrtools/dvdrtools-0.2.1.tar.gz
description :
	 Fork of cdrtools DVD writer support
build_deps :
link_deps :
conflicts :
	 cdrtools
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/8a41dd4/dvdrtools/patch-cdda2wav-cdda2wav.c
	 https://raw.githubusercontent.com/Homebrew/formula-patches/8a41dd4/dvdrtools/patch-cdrecord-cdrecord.c
	 https://raw.githubusercontent.com/Homebrew/formula-patches/8a41dd4/dvdrtools/patch-scsi-mac-iokit.c
EOF_patch :
install :
	 ENV["LIBS"] = "-framework IOKit -framework CoreFoundation"
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make", "install"
