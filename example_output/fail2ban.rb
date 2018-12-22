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
	 end
	 inreplace "setup.py" do |s|
	 s.gsub! %r{/etc}, etc
	 s.gsub! %r{/var}, var
	 end
	 inreplace Dir["config/{action,filter}.d/**/*"].select { |ff| File.file?(ff) }.each do |s|
	 s.gsub! %r{/etc}, etc, false
	 s.gsub! %r{/var}, var, false
	 end
	 inreplace ["config/fail2ban.conf", "config/paths-common.conf", "doc/run-rootless.txt"].each do |s|
	 s.gsub! %r{/etc}, etc
	 s.gsub! %r{/var}, var
	 end
	 inreplace Dir["fail2ban/client/*"].each do |s|
	 s.gsub! %r{/etc}, etc, false
	 s.gsub! %r{/var}, var, false
	 end
	 inreplace "fail2ban/server/asyncserver.py", "/var/run/fail2ban/fail2ban.sock",
	 var/"run/fail2ban/fail2ban.sock"
	 inreplace Dir["fail2ban/tests/**/*"].select { |ff| File.file?(ff) }.each do |s|
	 s.gsub! %r{/etc}, etc, false
	 s.gsub! %r{/var}, var, false
	 end
	 inreplace Dir["man/*"].each do |s|
	 s.gsub! %r{/etc}, etc, false
	 s.gsub! %r{/var}, var, false
	 end
	 inreplace "setup.py", "/usr/share/doc/fail2ban", (share/"doc")
	 inreplace "setup.py", "if os.path.exists('#{var}/run')", "if True"
	 inreplace "setup.py", "platform_system in ('linux',", "platform_system in ('linux', 'darwin',"
	 system "python", "setup.py", "install", "--prefix=#{libexec}"
	 cd "doc" do
	 system "make", "dirhtml", "SPHINXBUILD=sphinx-build"
	 (share/"doc").install "build/dirhtml"
	 end
	 bin.install Dir[libexec/"bin/*"]
	 bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
	 man1.install Dir["man/*.1"]
	 man5.install "man/jail.conf.5"
	 (etc/"fail2ban").mkpath
	 (var/"run/fail2ban").mkpath
