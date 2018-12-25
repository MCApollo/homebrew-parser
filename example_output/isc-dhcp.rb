name :
	 IscDhcp
homepage :
	 https://www.isc.org/software/dhcp
url :
	 https://ftp.isc.org/isc/dhcp/4.4.1/dhcp-4.4.1.tar.gz
description :
	 Production-grade DHCP solution
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
	 dhcpd_dir = var+"dhcpd"
	 path_opts = {
	 "_PATH_DHCPD_CONF"    => etc+"dhcpd.conf",
	 "_PATH_DHCLIENT_CONF" => etc+"dhclient.conf",
	 "_PATH_DHCPD_DB"      => dhcpd_dir+"dhcpd.leases",
	 "_PATH_DHCPD6_DB"     => dhcpd_dir+"dhcpd6.leases",
	 "_PATH_DHCLIENT_DB"   => dhcpd_dir+"dhclient.leases",
	 "_PATH_DHCLIENT6_DB"  => dhcpd_dir+"dhclient6.leases",
	 "_PATH_DHCPD_PID"     => dhcpd_dir+"dhcpd.pid",
	 "_PATH_DHCPD6_PID"    => dhcpd_dir+"dhcpd6.pid",
	 "_PATH_DHCLIENT_PID"  => dhcpd_dir+"dhclient.pid",
	 "_PATH_DHCLIENT6_PID" => dhcpd_dir+"dhclient6.pid",
	 "_PATH_DHCRELAY_PID"  => dhcpd_dir+"dhcrelay.pid",
	 "_PATH_DHCRELAY6_PID" => dhcpd_dir+"dhcrelay6.pid",
	 }
	 path_opts.each do |symbol, path|
	 ENV.append "CFLAGS", "-D#{symbol}='\"#{path}\"'"
	 end
	 ENV.append "CFLAGS", "-D__APPLE_USE_RFC_3542" if MacOS.version >= :lion
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--localstatedir=#{dhcpd_dir}"
	 ENV.deparallelize { system "make", "-C", "bind" }
	 inreplace "Makefile", "SUBDIRS = ${top_srcdir}/bind", "SUBDIRS = "
	 system "make"
	 system "make", "install"
	 Dir.open("#{prefix}/etc") do |dir|
	 dir.each do |f|
	 file = "#{dir.path}/#{f}"
	 File.rename(file, "#{file}.sample") if File.file?(file)
	 end
	 end
	 dhcpd_dir.mkpath
	 %w[dhcpd dhcpd6 dhclient dhclient6].each do |f|
	 file = "#{dhcpd_dir}/#{f}.leases"
	 File.new(file, File::CREAT|File::RDONLY).close
	 end
	 (prefix+"homebrew.mxcl.dhcpd6.plist").write plist_dhcpd6
	 (prefix+"homebrew.mxcl.dhcpd6.plist").chmod 0644
