name :
	 Stgit
homepage :
	 https://github.com/ctmarinas/stgit
url :
	 https://github.com/ctmarinas/stgit/archive/v0.19.tar.gz
description :
	 Push/pop utility built on top of Git
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
	 ENV["PYTHON"] = "python"
	 system "make", "prefix=#{prefix}", "all"
	 system "make", "prefix=#{prefix}", "install"
