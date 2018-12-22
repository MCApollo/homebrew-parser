name :
	 Dungeon
homepage :
	 https://github.com/GOFAI/dungeon
url :
	 https://github.com/GOFAI/dungeon/archive/4.0.tar.gz
description :
	 The classic text adventure
build_deps :
link_deps :
	 gcc
conflicts :
patches :
EOF_patch :
install :
	 chdir "src" do
	 inreplace "game.f" do |s|
	 s.gsub! "FILE='dindx',STATUS='OLD',", "FILE='#{opt_pkgshare}/dindx',"
	 s.gsub! "1\tFORM='FORMATTED',ACCESS='SEQUENTIAL',ERR=1900)", "1\tSTATUS='OLD',FORM='FORMATTED',
	 \t2\tACCESS='SEQUENTIAL',ERR=1900)"
	 s.gsub! "FILE='dtext',STATUS='OLD',", "FILE='#{opt_pkgshare}/dtext',"
	 s.gsub! "1\tFORM='UNFORMATTED',ACCESS='DIRECT',", "1\tSTATUS='OLD',FORM='UNFORMATTED',ACCESS='DIRECT',"
	 end
	 system "make"
	 bin.install "dungeon"
	 end
	 pkgshare.install "dindx"
	 pkgshare.install "dtext"
	 man.install "dungeon.txt"
	 man.install "hints.txt"
