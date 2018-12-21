name :
	 Bitchx
homepage :
	 https://bitchx.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/bitchx/ircii-pana/bitchx-1.2.1/bitchx-1.2.1.tar.gz
description :
	 Text-based, scriptable IRC client
build_deps :
link_deps :
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 plugins = %w[acro aim arcfour amp autocycle blowfish cavlink encrypt
	 fserv hint identd nap pkga possum qbx qmail]
	 args = %W[
	 --prefix=#{prefix}
	 --with-ssl
	 --with-plugins=#{plugins * ","}
	 --enable-ipv6
	 --mandir=#{man}
	 ]
	 system "./configure", *args
	 system "make"
	 system "make", "install"
