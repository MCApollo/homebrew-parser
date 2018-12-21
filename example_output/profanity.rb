name :
	 Profanity
homepage :
	 http://www.profanity.im/
url :
	 http://www.profanity.im/profanity-0.5.1.tar.gz
description :
	 Console based XMPP client
build_deps :
	 pkg-config
link_deps :
	 glib
	 gnutls
	 gpgme
	 libotr
	 libstrophe
	 openssl
	 ossp-uuid
	 readline
	 terminal-notifier
conflicts :
patches :
EOF_patch :
install :
	 system "./bootstrap.sh" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
