name :
	 Pincaster
homepage :
	 https://github.com/jedisct1/Pincaster
url :
	 https://download.pureftpd.org/pincaster/releases/pincaster-0.6.tar.bz2
description :
	 Nosql database with a HTTP/JSON interface
build_deps :
link_deps :
	 openssl
optional_deps :
conflicts :
	 libevent
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}", "--with-yajl=embedded"
	 system "make", "install"
	 inreplace "pincaster.conf" do |s|
	 s.gsub! "/var/db/pincaster/pincaster.db", "#{var}/db/pincaster/pincaster.db"
	 s.gsub! "
	 end
	 etc.install "pincaster.conf"
	 (var/"db/pincaster/").mkpath
