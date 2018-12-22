name :
	 Rogue
homepage :
	 https://sourceforge.net/projects/roguelike/
url :
	 https://src.fedoraproject.org/repo/pkgs/rogue/rogue5.4.4-src.tar.gz/033288f46444b06814c81ea69d96e075/rogue5.4.4-src.tar.gz
description :
	 Dungeon crawling video game
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV.ncurses_define
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 inreplace "config.h", "rogue.scr", "#{var}/rogue/rogue.scr"
	 inreplace "Makefile" do |s|
	 s.gsub! "-if test -d $(man6dir) ; then $(INSTALL) -m 0644 rogue.6 $(DESTDIR)$(man6dir)/$(PROGRAM).6 ; fi", ""
	 s.gsub! "-if test ! -d $(man6dir) ; then $(INSTALL) -m 0644 rogue.6 $(DESTDIR)$(mandir)/$(PROGRAM).6 ; fi", ""
	 end
	 system "make", "install"
	 man6.install gzip("rogue.6")
	 libexec.mkpath
	 (var/"rogue").mkpath
