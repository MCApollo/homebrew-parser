name :
	 Imapfilter
homepage :
	 https://github.com/lefcha/imapfilter/
url :
	 https://github.com/lefcha/imapfilter/archive/v2.6.12.tar.gz
description :
	 IMAP message processor/filter
build_deps :
link_deps :
	 lua
	 openssl
	 pcre
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 inreplace "src/Makefile" do |s|
	 s.change_make_var! "CFLAGS", "#{s.get_make_var "CFLAGS"} #{ENV.cflags}"
	 end
	 ENV.append "CPPFLAGS", "-I#{Formula["lua"].opt_include}/lua"
	 ENV.append "LDFLAGS", "-L#{Formula["pcre"].opt_lib}"
	 ENV.append "LDFLAGS", "-L#{Formula["lua"].opt_lib}"
	 ENV.append "LDFLAGS", "-liconv"
	 system "make", "PREFIX=#{prefix}", "MANDIR=#{man}", "LDFLAGS=#{ENV.ldflags}"
	 system "make", "PREFIX=#{prefix}", "MANDIR=#{man}", "install"
	 prefix.install "samples"
