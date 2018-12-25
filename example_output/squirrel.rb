name :
	 Squirrel
homepage :
	 http://www.squirrel-lang.org
url :
	 https://downloads.sourceforge.net/project/squirrel/squirrel3/squirrel%203.1%20stable/squirrel_3_1_stable.tar.gz
description :
	 High level, imperative, object-oriented programming language
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/dcaba40/squirrel/xcode9.patch
EOF_patch :
install :
	 system "make"
	 prefix.install %w[bin include lib]
	 doc.install Dir["doc/*.pdf"]
	 doc.install %w[etc samples]
	 (lib+"pkgconfig/libsquirrel.pc").write pc_file
