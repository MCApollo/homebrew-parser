name :
	 Wpscan
homepage :
	 https://wpscan.org
url :
	 https://github.com/wpscanteam/wpscan/archive/2.9.4.tar.gz
description :
	 Black box WordPress vulnerability scanner
build_deps :
link_deps :
	 ruby
conflicts :
patches :
EOF_patch :
install :
	 inreplace "lib/common/common_helper.rb" do |s|
	 s.gsub! "File.join(USER_DIR, '.wpscan/cache')", "'#{var}/cache/wpscan'"
	 s.gsub! "File.join(USER_DIR, '.wpscan/data')", "'#{var}/wpscan/data'"
	 s.gsub! "File.join(USER_DIR, '.wpscan/log.txt')", "'#{var}/log/wpscan/log.txt'"
	 end
	 system "unzip", "-o", "data.zip"
	 libexec.install "data", "lib", "spec", "Gemfile", "Gemfile.lock", "wpscan.rb"
	 ENV["GEM_HOME"] = libexec
	 ENV["BUNDLE_PATH"] = libexec
	 ENV["BUNDLE_GEMFILE"] = libexec/"Gemfile"
	 system "gem", "install", "bundler"
	 bundle = Dir["#{libexec}/**/bundle"].last
	 system bundle, "install", "--without", "test"
	 (bin/"wpscan").write <<~EOS
	 #!/bin/bash
	 GEM_HOME="#{libexec}" BUNDLE_GEMFILE="#{libexec}/Gemfile" \\
	 exec "#{bundle}" exec "#{Formula["ruby"].opt_bin}/ruby" \\
	 "#{libexec}/wpscan.rb" "$@"
	 EOS
	 (var/"log/wpscan").mkpath
	 system bin/"wpscan", "--update"
