name :
	 Tintin
homepage :
	 https://tintin.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/tintin/TinTin%2B%2B%20Source%20Code/2.01.4/tintin-2.01.4.tar.gz
description :
	 MUD client
build_deps :
link_deps :
	 gnutls
	 pcre
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.append "LDFLAGS", "-L#{HOMEBREW_PREFIX}/lib"
	 cd "src" do
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "CFLAGS=#{ENV.cflags}",
	 "INCS=#{ENV.cppflags}",
	 "LDFLAGS=#{ENV.ldflags}",
	 "install"
	 end
