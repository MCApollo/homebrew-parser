name :
	 Grok
homepage :
	 https://github.com/jordansissel/grok
url :
	 https://github.com/jordansissel/grok/archive/v0.9.2.tar.gz
description :
	 Powerful pattern-matching/reacting too
build_deps :
link_deps :
	 libevent
	 pcre
	 tokyo-cabinet
conflicts :
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 system "make", "grok"
	 system "make", "install", "PREFIX=#{prefix}"
