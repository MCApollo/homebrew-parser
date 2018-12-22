name :
	 Ngircd
homepage :
	 https://ngircd.barton.de/
url :
	 https://ngircd.barton.de/pub/ngircd/ngircd-24.tar.gz
description :
	 Next generation IRC daemon
build_deps :
link_deps :
	 libident
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--sysconfdir=#{HOMEBREW_PREFIX}/etc",
	 "--enable-ipv6",
	 "--with-ident",
	 "--with-openssl"
	 system "make", "install"
	 prefix.install "contrib/MacOSX/de.barton.ngircd.plist.tmpl" => "de.barton.ngircd.plist"
	 (prefix+"de.barton.ngircd.plist").chmod 0644
	 inreplace prefix+"de.barton.ngircd.plist" do |s|
	 s.gsub! ":SBINDIR:", sbin
	 s.gsub! "/Library/Logs/ngIRCd.log", var/"Logs/ngIRCd.log"
	 end
