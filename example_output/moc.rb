name :
	 Moc
homepage :
	 https://moc.daper.net/
url :
	 http://ftp.daper.net/pub/soft/moc/stable/moc-2.5.2.tar.bz2
description :
	 Terminal-based music player
build_deps :
	 autoconf
	 automake
	 gettext
	 pkg-config
link_deps :
	 berkeley-db
	 ffmpeg
	 jack
	 libtool
	 ncurses
conflicts :
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/514941c/moc/01-codec-2.5.2.patch
	 https://raw.githubusercontent.com/Homebrew/formula-patches/514941c/moc/02-codecpar-2.5.2.patch
	 https://raw.githubusercontent.com/Homebrew/formula-patches/514941c/moc/03-defines-2.5.2.patch
	 https://raw.githubusercontent.com/Homebrew/formula-patches/514941c/moc/04-lockmgr-2.5.2.patch
	 https://raw.githubusercontent.com/Homebrew/formula-patches/514941c/moc/05-audio4-2.5.2.patch
EOF_patch :
install :
	 system "autoreconf", "-fvi"
	 system "./configure", "--disable-debug", "--prefix=#{prefix}"
	 system "make", "install"
