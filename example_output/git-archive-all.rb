name :
	 GitArchiveAll
homepage :
	 https://github.com/Kentzo/git-archive-all
url :
	 https://github.com/Kentzo/git-archive-all/archive/1.19.4.tar.gz
description :
	 Archive a project and its submodules
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
	 system "make", "prefix=#{prefix}", "install"
