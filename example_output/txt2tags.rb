name :
	 Txt2tags
homepage :
	 https://txt2tags.org/
url :
	 https://github.com/txt2tags/txt2tags/archive/2.6.tar.gz
description :
	 Conversion tool to generating several file formats
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 bin.install "txt2tags"
	 man1.install "doc/English/manpage.man" => "txt2tags.1"
