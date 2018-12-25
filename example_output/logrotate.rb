name :
	 Logrotate
homepage :
	 https://github.com/logrotate/logrotate
url :
	 https://github.com/logrotate/logrotate/releases/download/3.14.0/logrotate-3.14.0.tar.gz
description :
	 Rotates, compresses, and mails system logs
build_deps :
link_deps :
	 popt
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--with-compress-command=/usr/bin/gzip",
	 "--with-uncompress-command=/usr/bin/gunzip",
	 "--with-state-file-path=#{var}/lib/logrotate.status"
	 system "make", "install"
	 inreplace "examples/logrotate-default", "/etc/logrotate.d", "#{etc}/logrotate.d"
	 etc.install "examples/logrotate-default" => "logrotate.conf"
	 (etc/"logrotate.d").mkpath
