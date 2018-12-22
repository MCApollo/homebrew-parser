name :
	 Chezscheme
homepage :
	 https://cisco.github.io/ChezScheme/
url :
	 https://github.com/cisco/ChezScheme/archive/v9.5.tar.gz
description :
	 Chez Scheme
build_deps :
	 :x11
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 if MacOS.version == "10.11" && MacOS::Xcode.installed? && MacOS::Xcode.version >= "8.0"
	 inreplace "c/stats.c" do |s|
	 s.gsub! "CLOCK_MONOTONIC", "UNDEFINED_GIBBERISH"
	 s.gsub! "CLOCK_PROCESS_CPUTIME_ID", "UNDEFINED_GIBBERISH"
	 s.gsub! "CLOCK_REALTIME", "UNDEFINED_GIBBERISH"
	 s.gsub! "CLOCK_THREAD_CPUTIME_ID", "UNDEFINED_GIBBERISH"
	 end
