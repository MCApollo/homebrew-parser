name :
	 Lighttpd
homepage :
	 https://www.lighttpd.net/
url :
	 https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.52.tar.xz
description :
	 Small memory footprint, flexible web-server
build_deps :
	 autoconf
	 automake
	 libtool
	 pkg-config
link_deps :
	 openldap
	 openssl
	 pcre
optional_deps :
	 libev
	 lua@5.1
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = %W[
	 --disable-dependency-tracking
	 --disable-silent-rules
	 --prefix=#{prefix}
	 --sbindir=#{bin}
	 --with-openssl
	 --with-ldap
	 --with-zlib
	 --with-bzip2
	 ]
	 args << "--with-lua" if build.with? "lua@5.1"
	 args << "--with-libev" if build.with? "libev"
	 system "./autogen.sh"
	 system "./configure", *args
	 system "make", "install"
	 unless File.exist? config_path
	 config_path.install "doc/config/lighttpd.conf", "doc/config/modules.conf"
	 (config_path/"conf.d/").install Dir["doc/config/conf.d/*.conf"]
	 inreplace config_path+"lighttpd.conf" do |s|
	 s.sub!(/^var\.log_root\s*=\s*".+"$/, "var.log_root    = \"#{log_path}\"")
	 s.sub!(/^var\.server_root\s*=\s*".+"$/, "var.server_root = \"#{www_path}\"")
	 s.sub!(/^var\.state_dir\s*=\s*".+"$/, "var.state_dir   = \"#{run_path}\"")
	 s.sub!(/^var\.home_dir\s*=\s*".+"$/, "var.home_dir    = \"#{run_path}\"")
	 s.sub!(/^var\.conf_dir\s*=\s*".+"$/, "var.conf_dir    = \"#{config_path}\"")
	 s.sub!(/^server\.port\s*=\s*80$/, "server.port = 8080")
	 s.sub!(%r{^server\.document-root\s*=\s*server_root \+ "\/htdocs"$}, "server.document-root = server_root")
	 s.sub!(/^server.use-ipv6\s*=\s*"enable"$/, 'server.use-ipv6 = "disable"')
	 s.sub!(/^server\.username\s*=\s*".+"$/, 'server.username  = "_www"')
	 s.sub!(/^server\.groupname\s*=\s*".+"$/, 'server.groupname = "_www"')
	 s.sub!(/^server\.event-handler\s*=\s*"linux-sysepoll"$/, 'server.event-handler = "select"')
	 s.sub!(/^server\.network-backend\s*=\s*"sendfile"$/, 'server.network-backend = "writev"')
	 s.sub!(/^server\.max-connections = .+$/, "server.max-connections = " + (MAX_FDS / 2).to_s)
	 end
	 end
	 log_path.mkpath
	 (www_path/"htdocs").mkpath
	 run_path.mkpath
