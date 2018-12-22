name :
	 Libvoikko
homepage :
	 https://voikko.puimula.org/
url :
	 https://www.puimula.org/voikko-sources/libvoikko/libvoikko-4.2.tar.gz
description :
	 Linguistic software and Finnish dictionary
build_deps :
	 foma
	 pkg-config
	 python
link_deps :
	 hfstospell
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--with-dictionary-path=#{HOMEBREW_PREFIX}/lib/voikko"
	 system "make", "install"
	 resource("voikko-fi").stage do
	 ENV.append_path "PATH", bin.to_s
	 system "make", "vvfst"
	 system "make", "vvfst-install", "DESTDIR=#{lib}/voikko"
	 lib.install_symlink "voikko"
	 end
