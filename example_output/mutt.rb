name :
	 Mutt
homepage :
	 http://www.mutt.org/
url :
	 https://bitbucket.org/mutt/mutt/downloads/mutt-1.11.1.tar.gz
description :
	 Mongrel of mail user agents (part elm, pine, mush, mh, etc.)
build_deps :
	 autoconf
	 automake
link_deps :
	 openssl
	 tokyo-cabinet
optional_deps :
	 gpgme
conflicts :
	 tin
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 user_in_mail_group = Etc.getgrnam("mail").mem.include?(ENV["USER"])
	 effective_group = Etc.getgrgid(Process.egid).name
	 args = %W[
	 --disable-dependency-tracking
	 --disable-warnings
	 --prefix=#{prefix}
	 --enable-debug
	 --enable-hcache
	 --enable-imap
	 --enable-pop
	 --enable-sidebar
	 --enable-smtp
	 --with-gss
	 --with-sasl
	 --with-ssl=#{Formula["openssl"].opt_prefix}
	 --with-tokyocabinet
	 ]
	 args << "--enable-gpgme" if build.with? "gpgme"
	 system "./prepare", *args
	 system "make"
	 unless user_in_mail_group
	 inreplace "Makefile", /^DOTLOCK_GROUP =.*$/, "DOTLOCK_GROUP = #{effective_group}"
	 end
	 system "make", "install"
	 doc.install resource("html") if build.head?
