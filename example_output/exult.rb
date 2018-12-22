name :
	 Exult
homepage :
	 https://exult.sourceforge.io/
url :
	 75aff2e97a4867d7810f8907796f58cb11b87a39
description :
	 Recreation of Ultima 7
build_deps :
	 autoconf
	 automake
	 libtool
	 pkg-config
link_deps :
	 libogg
	 libvorbis
	 sdl2
conflicts :
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/c9cb2e28/exult/clang9.patch
EOF_patch :
install :
	 inreplace "files/utils.cc" do |s|
	 s.gsub! /(gamehome_dir)\("\."\)/, '\1(home_dir)'
	 s.gsub! /(gamehome_dir) =/, '\1 +='
	 end
	 system "./autogen.sh"
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "EXULT_DATADIR=#{pkgshare}/data"
	 system "make", "bundle"
	 pkgshare.install "Exult.app/Contents/Resources/data"
	 prefix.install "Exult.app"
	 bin.write_exec_script "#{prefix}/Exult.app/Contents/MacOS/exult"
