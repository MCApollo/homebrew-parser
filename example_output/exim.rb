name :
	 Exim
homepage :
	 https://exim.org
url :
	 https://ftp.exim.org/pub/exim/exim4/exim-4.91.tar.xz
description :
	 Complete replacement for sendmail
build_deps :
link_deps :
	 berkeley-db@4
	 openssl
	 pcre
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 cp "src/EDITME", "Local/Makefile"
	 inreplace "Local/Makefile" do |s|
	 s.remove_make_var! "EXIM_MONITOR"
	 s.change_make_var! "EXIM_USER", ENV["USER"]
	 s.change_make_var! "SYSTEM_ALIASES_FILE", etc/"aliases"
	 s.gsub! "/usr/exim/configure", etc/"exim.conf"
	 s.gsub! "/usr/exim", prefix
	 s.gsub! "/var/spool/exim", var/"spool/exim"
	 s.gsub! 'TMPDIR="/tmp"', "TMPDIR=/tmp"
	 s << "SUPPORT_MAILDIR=yes\n" if build.with? "maildir"
	 s << "AUTH_PLAINTEXT=yes\n"
	 s << "SUPPORT_TLS=yes\n"
	 s << "TLS_LIBS=-lssl -lcrypto\n"
	 s << "TRANSPORT_LMTP=yes\n"
	 s << "LOOKUP_INCLUDE=-I#{HOMEBREW_PREFIX}/include\n"
	 s << "LOOKUP_LIBS=-L#{HOMEBREW_PREFIX}/lib\n"
	 end
	 bdb4 = Formula["berkeley-db@4"]
	 mv Dir["OS/unsupported/*Darwin*"], "OS"
	 inreplace "OS/Makefile-Darwin" do |s|
	 s.remove_make_var! %w[CC CFLAGS]
	 s.gsub! "
	 s.gsub! "DBMLIB =", "DBMLIB=#{bdb4.lib}/libdb-4.dylib"
	 end
	 ENV.append "CFLAGS", ENV.cppflags
	 ENV.deparallelize
	 system "make"
	 system "make", "INSTALL_ARG=-no_chown", "install"
	 man8.install "doc/exim.8"
	 (bin/"exim_ctl").write startup_script
