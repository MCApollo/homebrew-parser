name :
	 Pdns
homepage :
	 https://www.powerdns.com
url :
	 https://downloads.powerdns.com/releases/pdns-4.1.4.tar.bz2
description :
	 Authoritative nameserver
build_deps :
	 pkg-config
link_deps :
	 boost
	 lua
	 openssl
	 sqlite
	 postgresql
conflicts :
patches :
EOF_patch :
install :
	 ENV["SDKROOT"] = MacOS.sdk_path if MacOS.version == :sierra
	 args = %W[
	 --prefix=#{prefix}
	 --sysconfdir=#{etc}/powerdns
	 --with-lua
	 --with-openssl=#{Formula["openssl"].opt_prefix}
	 --with-sqlite3
	 ]
	 if build.with? "postgresql"
	 args << "--with-modules=gsqlite3 gpgsql"
	 elsif build.with? "remote"
	 args << "--with-modules=gsqlite3 remote"
	 else
	 args << "--with-modules=gsqlite3"
