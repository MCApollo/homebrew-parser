name :
	 Aterm
homepage :
	 https://strategoxt.org/Tools/ATermFormat
url :
	 http://www.meta-environment.org/releases/aterm-2.8.tar.gz
description :
	 Annotated Term for tree-like ADT exchange
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
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 ENV.deparallelize
	 system "make", "install"
