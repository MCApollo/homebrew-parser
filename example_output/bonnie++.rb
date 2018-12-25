name :
	 Bonniexx
homepage :
	 https://www.coker.com.au/bonnie++/
url :
	 https://www.coker.com.au/bonnie++/bonnie++-1.97.3.tgz
description :
	 Benchmark suite for file systems and hard drives
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/57a21ef/bonnie%2B%2B/remove-large-file-support-macros.diff
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make", "install"
