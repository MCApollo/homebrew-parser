name :
	 Sleepwatcher
homepage :
	 https://www.bernhard-baehr.de/
url :
	 https://www.bernhard-baehr.de/sleepwatcher_2.2.tgz
description :
	 Monitors sleep, wakeup, and idleness of a Mac
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 inreplace "sources/Makefile" do |s|
	 s.gsub! /^(CFLAGS)_PPC.*$/, "\\1 = #{ENV.cflags} -prebind"
	 s.gsub! /^(CFLAGS_X86)/, "#\\1"
	 s.change_make_var! "BINDIR", "$(PREFIX)/sbin"
	 s.change_make_var! "MANDIR", "$(PREFIX)/share/man"
	 s.gsub! /^(.*?)CFLAGS_PPC(.*?)[.]ppc/, "\\1CFLAGS\\2"
	 s.gsub! /^(.*?CFLAGS_X86.*?[.]x86)/, "#\\1"
	 s.gsub! /^(\t(lipo|rm).*?[.](ppc|x86))/, "#\\1"
	 s.gsub! "-o root -g wheel", ""
