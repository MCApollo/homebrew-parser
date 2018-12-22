name :
	 GetIplayer
homepage :
	 https://github.com/get-iplayer/get_iplayer
url :
	 https://github.com/get-iplayer/get_iplayer/archive/v3.17.tar.gz
description :
	 Utility for downloading TV and radio programmes from BBC iPlayer
build_deps :
link_deps :
	 atomicparsley
	 ffmpeg
	 :macos
conflicts :
patches :
EOF_patch :
install :
	 ENV.prepend_create_path "PERL5LIB", libexec/"lib/perl5"
	 ENV["NO_NETWORK_TESTING"] = "1"
	 resources.each do |r|
	 r.stage do
	 system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}"
	 system "make", "install"
	 end
	 end
	 inreplace ["get_iplayer", "get_iplayer.cgi"] do |s|
	 s.gsub!(/^(my \$version_text);/i, "\\1 = \"#{pkg_version}-homebrew\";")
	 s.gsub! "#!/usr/bin/env perl", "#!/usr/bin/perl"
	 end
	 bin.install "get_iplayer", "get_iplayer.cgi"
	 bin.env_script_all_files(libexec/"bin", :PERL5LIB => ENV["PERL5LIB"])
	 man1.install "get_iplayer.1"
