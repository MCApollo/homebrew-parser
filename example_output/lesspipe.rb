name :
	 Lesspipe
homepage :
	 https://www-zeuthen.desy.de/~friebel/unix/lesspipe.html
url :
	 https://downloads.sourceforge.net/project/lesspipe/lesspipe/1.83/lesspipe-1.83.tar.gz
description :
	 Input filter for the pager less
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
	 if build.with? "syntax-highlighting"
	 inreplace "configure", '$ifsyntax = "\L$ifsyntax";', '$ifsyntax = "\Ly";'
	 end
	 system "./configure", "--prefix=#{prefix}", "--yes"
	 man1.mkpath
	 system "make", "install"
