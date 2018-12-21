name :
	 Dict
homepage :
	 http://www.dict.org/
url :
	 https://downloads.sourceforge.net/project/dict/dictd/dictd-1.12.1/dictd-1.12.1.tar.gz
description :
	 Dictionary Server Protocol (RFC2229) client
build_deps :
	 libtool
link_deps :
	 libmaa
conflicts :
patches :
EOF_patch :
install :
	 ENV["LIBTOOL"] = "glibtool"
	 system "./configure", "--prefix=#{prefix}", "--sysconfdir=#{etc}",
	 "--mandir=#{man}"
	 system "make"
	 system "make", "install"
	 (prefix+"etc/dict.conf").write <<~EOS
	 server localhost
	 server dict.org
	 EOS
