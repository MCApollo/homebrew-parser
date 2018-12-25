name :
	 IrcdIrc2
homepage :
	 http://www.irc.org/
url :
	 http://www.irc.org/ftp/irc/server/irc2.11.2p3.tgz
description :
	 Original IRC server daemon
build_deps :
link_deps :
optional_deps :
conflicts :
	 ircd-hybrid
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}",
	 "--localstatedir=#{var}",
	 "--sysconfdir=#{etc}",
	 "--mandir=#{man}",
	 "CFLAGS=-DRLIMIT_FDMAX=0"
	 build_dir = `./support/config.guess`.chomp
	 inreplace "#{build_dir}/config.h", /#define DEFAULT_SPLIT_USERS\s+65000/,
	 "#define DEFAULT_SPLIT_USERS 0"
	 inreplace "#{build_dir}/config.h", /#define DEFAULT_SPLIT_SERVERS\s+80/,
	 "#define DEFAULT_SPLIT_SERVERS 0"
	 system "make", "install", "-C", build_dir
	 (etc/"ircd.conf").write default_ircd_conf
