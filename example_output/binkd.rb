name :
	 Binkd
homepage :
	 http://binkd.grumbler.org/
url :
	 https://happy.kiev.ua/pub/fidosoft/mailer/binkd/binkd-1.0.4.tar.gz
description :
	 TCP/IP FTN Mailer
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 cp Dir["mkfls/unix/*"].select { |f| File.file? f }, "."
	 inreplace "binkd.conf", "/var/", "#{var}/"
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make", "install"
