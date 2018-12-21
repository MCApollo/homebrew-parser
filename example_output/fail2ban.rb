name :
	 Fail2ban
homepage :
	 https://www.fail2ban.org/
url :
	 https://github.com/fail2ban/fail2ban/archive/0.10.4.tar.gz
description :
	 Scan log files and ban IPs showing malicious signs
build_deps :
	 help2man
	 sphinx-doc
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python2.7/site-packages"
	 rm "setup.cfg"
	 Dir["config/paths-*.conf"].each do |r|
	 next if File.basename(r) =~ /paths-common\.conf|paths-osx\.conf/
	 rm r
	 (etc/"fail2ban").mkpath
	 (var/"run/fail2ban").mkpath
