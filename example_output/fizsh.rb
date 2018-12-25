name :
	 Fizsh
homepage :
	 https://github.com/zsh-users/fizsh
url :
	 https://downloads.sourceforge.net/project/fizsh/fizsh-1.0.9.tar.gz
description :
	 Fish-like front end for ZSH
build_deps :
link_deps :
	 zsh
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
