name :
	 Fortune
homepage :
	 https://www.ibiblio.org/pub/linux/games/amusements/fortune/!INDEX.html
url :
	 https://www.ibiblio.org/pub/linux/games/amusements/fortune/fortune-mod-9708.tar.gz
description :
	 Infamous electronic fortune-cookie generator
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 inreplace "Makefile" do |s|
	 s.change_make_var! "CC", ENV.cc
	 s.change_make_var! "FORTDIR", "/usr/local/bin"
	 s.gsub! "/usr/local/man", "/usr/local/share/man"
	 s.gsub! "/usr/local", prefix
	 s.change_make_var! "REGEXDEFS", "-DHAVE_REGEX_H -DPOSIX_REGEX"
