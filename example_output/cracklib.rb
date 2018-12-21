name :
	 Cracklib
homepage :
	 https://github.com/cracklib/cracklib
url :
	 https://github.com/cracklib/cracklib/releases/download/cracklib-2.9.6/cracklib-2.9.6.tar.gz
description :
	 LibCrack password checking library
build_deps :
link_deps :
	 gettext
conflicts :
patches :
	 https://github.com/cracklib/cracklib/commit/47e5dec.patch?full_index=1
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--sbindir=#{bin}",
	 "--without-python",
	 "--with-default-dict=#{var}/cracklib/cracklib-words"
	 system "make", "install"
	 share.install resource("cracklib-words")
	 (var/"cracklib").mkpath
	 cp share/"cracklib-words-#{version}", var/"cracklib/cracklib-words"
	 system "#{bin}/cracklib-packer < #{var}/cracklib/cracklib-words"
