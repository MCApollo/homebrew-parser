name :
	 Unbound
homepage :
	 https://www.unbound.net
url :
	 https://www.unbound.net/downloads/unbound-1.8.1.tar.gz
description :
	 Validating, recursive, caching DNS resolver
build_deps :
link_deps :
	 libevent
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 args = %W[
	 --prefix=#{prefix}
	 --sysconfdir=#{etc}
	 --with-libevent=#{Formula["libevent"].opt_prefix}
	 --with-ssl=#{Formula["openssl"].opt_prefix}
	 ]
	 args << "--with-libexpat=#{MacOS.sdk_path}/usr" if MacOS.sdk_path_if_needed
	 system "./configure", *args
	 inreplace "doc/example.conf", 'username: "unbound"', 'username: "@@HOMEBREW-UNBOUND-USER@@"'
	 system "make"
	 system "make", "test"
	 system "make", "install"
	 conf = etc/"unbound/unbound.conf"
	 return unless conf.exist?
	 return unless conf.read.include?('username: "@@HOMEBREW-UNBOUND-USER@@"')
	 inreplace conf, 'username: "@@HOMEBREW-UNBOUND-USER@@"',
	 "username: \"#{ENV["USER"]}\""
