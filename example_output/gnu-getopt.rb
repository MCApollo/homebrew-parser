name :
	 GnuGetopt
homepage :
	 http://frodo.looijaard.name/project/getopt
url :
	 http://frodo.looijaard.name/system/files/software/getopt/getopt-1.1.6.tar.gz
description :
	 Command-line option parsing library
build_deps :
link_deps :
	 gettext
conflicts :
patches :
EOF_patch :
install :
	 inreplace "Makefile" do |s|
	 gettext = Formula["gettext"]
	 s.change_make_var! "CPPFLAGS", "\\1 -I#{gettext.include}"
	 s.change_make_var! "LDFLAGS", "\\1 -L#{gettext.lib} -lintl"
