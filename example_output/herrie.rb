name :
	 Herrie
homepage :
	 https://herrie.info/
url :
	 https://github.com/EdSchouten/herrie/releases/download/herrie-2.2/herrie-2.2.tar.bz2
description :
	 Minimalistic audio player built upon Ncurses
build_deps :
	 pkg-config
link_deps :
	 gettext
	 glib
	 libid3tag
	 libsndfile
	 libvorbis
	 mad
conflicts :
patches :
EOF_patch :
install :
	 ENV["PREFIX"] = prefix
	 system "./configure", "no_modplug", "no_xspf", "coreaudio", "ncurses"
	 system "make", "install"
