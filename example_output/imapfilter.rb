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
conflicts :
patches :
EOF_patch :
install :
	 inreplace "src/Makefile" do |s|
	 s.change_make_var! "CFLAGS", "#{s.get_make_var "CFLAGS"} #{ENV.cflags}"
