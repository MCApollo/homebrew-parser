name :
	 Mecab
homepage :
	 https://taku910.github.io/mecab/
url :
	 https://mirrors.ocf.berkeley.edu/debian/pool/main/m/mecab/mecab_0.996.orig.tar.gz
description :
	 Yet another part-of-speech and morphological analyzer
build_deps :
link_deps :
conflicts :
	 mecab-ko
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--sysconfdir=#{etc}"
	 system "make", "install"
	 inreplace "#{bin}/mecab-config", "${exec_prefix}/lib/mecab/dic", "#{HOMEBREW_PREFIX}/lib/mecab/dic"
	 inreplace "#{etc}/mecabrc", "#{lib}/mecab/dic", "#{HOMEBREW_PREFIX}/lib/mecab/dic"
	 (HOMEBREW_PREFIX/"lib/mecab/dic").mkpath
