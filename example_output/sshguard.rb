name :
	 Sshguard
homepage :
	 https://www.sshguard.net/
url :
	 https://downloads.sourceforge.net/project/sshguard/sshguard/2.2.0/sshguard-2.2.0.tar.gz
description :
	 Protect from brute force attacks against SSH
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "autoreconf", "-fiv" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--sysconfdir=#{etc}"
	 system "make", "install"
	 inreplace man8/"sshguard.8", "%PREFIX%/etc/", "#{etc}/"
	 cp "examples/sshguard.conf.sample", "examples/sshguard.conf"
	 inreplace "examples/sshguard.conf" do |s|
	 s.gsub! /^#BACKEND=.*$/, "BACKEND=\"#{opt_libexec}/sshg-fw-#{firewall}\""
	 if MacOS.version >= :sierra
	 s.gsub! %r{^#LOGREADER="/usr/bin/log}, "LOGREADER=\"/usr/bin/log"
	 else
	 s.gsub! /^#FILES.*$/, "FILES=#{log_path}"
