name :
	 Nvi
homepage :
	 https://sites.google.com/a/bostic.com/keithbostic/vi/
url :
	 https://mirrors.ocf.berkeley.edu/debian/pool/main/n/nvi/nvi_1.81.6.orig.tar.gz
description :
	 44BSD re-implementation of vi
build_deps :
	 xz
link_deps :
	 berkeley-db
conflicts :
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/8ef45e8b/nvi/patch-common__db.h
	 https://raw.githubusercontent.com/Homebrew/formula-patches/8ef45e8b/nvi/patch-dist__port.h.in
	 https://raw.githubusercontent.com/Homebrew/formula-patches/8ef45e8b/nvi/patch-ex_script.c.diff
	 https://mirrors.ocf.berkeley.edu/debian/pool/main/n/nvi/nvi_1.81.6-13.debian.tar.xz
EOF_patch :
install :
	 cd "dist" do
	 system "./configure", "--prefix=#{prefix}",
	 "--program-prefix=n",
	 "--disable-dependency-tracking"
	 system "make"
	 ENV.deparallelize
	 system "make", "install"
