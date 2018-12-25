name :
	 Tofrodos
homepage :
	 https://www.thefreecountry.com/tofrodos/
url :
	 https://tofrodos.sourceforge.io/download/tofrodos-1.7.13.tar.gz
description :
	 Converts DOS <-> UNIX text files, alias tofromdos
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 cd "src" do
	 system "make"
	 bin.install %w[todos fromdos]
	 man1.install "fromdos.1"
	 man1.install_symlink "fromdos.1" => "todos.1"
	 end
