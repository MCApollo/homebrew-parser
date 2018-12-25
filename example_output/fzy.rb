name :
	 Fzy
homepage :
	 https://github.com/jhawthorn/fzy
url :
	 https://github.com/jhawthorn/fzy/releases/download/1.0/fzy-1.0.tar.gz
description :
	 Fast, simple fuzzy text selector with an advanced scoring algorithm
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
	 system "make"
	 system "make", "PREFIX=#{prefix}", "install"
