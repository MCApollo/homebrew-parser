name :
	 Wrangler
homepage :
	 https://www.cs.kent.ac.uk/projects/wrangler/Wrangler/
url :
description :
	 Refactoring tool for Erlang with emacs and Eclipse integration
build_deps :
link_deps :
	 erlang@20
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
