name :
	 Lv
homepage :
	 https://web.archive.org/web/20160310122517/www.ff.iij4u.or.jp/~nrt/lv/
url :
	 https://web.archive.org/web/20150915000000/www.ff.iij4u.or.jp/~nrt/freeware/lv451.tar.gz
description :
	 Powerful multi-lingual file viewer/grep
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 inreplace "src/stream.c", 'gz_filter = "zcat"', 'gz_filter = "gzcat"'
	 cd "build" do
	 system "../src/configure", "--prefix=#{prefix}"
	 system "make"
	 bin.install "lv"
	 bin.install_symlink "lv" => "lgrep"
	 end
	 man1.install "lv.1"
	 (lib+"lv").install "lv.hlp"
