name :
	 Vitetris
homepage :
	 http://www.victornils.net/tetris/
url :
	 http://www.victornils.net/tetris/vitetris-0.57.tar.gz
description :
	 Terminal-based Tetris clone
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
	 --- a/Makefile  2013-10-07 11:57:18.000000000 +0200
	 +++ b/Makefile  2013-10-07 11:57:29.000000000 +0200
	 @@ -5,7 +5,7 @@
	 #HISCORE_FILENAME = /var/games/vitetris-hiscores
	 -INSTALL = install -oroot -groot
	 +INSTALL = install
	 @echo Done.
	 @@ -18,7 +18,7 @@
	 cd src; $(MAKE) tetris
	 mv -f src/tetris$(EXE) $(PROGNAME)
	 @echo stripping symbols to reduce program size:
	 -	-strip --strip-all $(PROGNAME)
	 +	-strip $(PROGNAME)
	 gameserver: src/netw/gameserver.c
	 cd src/netw; $(MAKE) gameserver
install :
	 system "./configure", "--prefix=#{prefix}", "--without-xlib"
	 system "make", "install"
