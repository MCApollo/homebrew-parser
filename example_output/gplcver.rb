name :
	 Gplcver
homepage :
	 https://gplcver.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/gplcver/gplcver/2.12a/gplcver-2.12a.src.tar.bz2
description :
	 Pragmatic C Software GPL Cver 2001
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 inreplace "src/makefile.osx" do |s|
	 s.gsub! "-mcpu=powerpc", ""
	 s.change_make_var! "CFLAGS", "$(INCS) $(OPTFLGS) #{ENV.cflags}"
	 s.change_make_var! "LFLAGS", ""
