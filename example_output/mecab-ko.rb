name :
	 MecabKo
homepage :
	 https://bitbucket.org/eunjeon/mecab-ko
url :
	 https://bitbucket.org/eunjeon/mecab-ko/downloads/mecab-0.996-ko-0.9.2.tar.gz
description :
	 See mecab
build_deps :
link_deps :
optional_deps :
conflicts :
	 mecab
resource :
	 []
	 []
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
