name :
	 Halibut
homepage :
	 https://www.chiark.greenend.org.uk/~sgtatham/halibut/
url :
	 https://www.chiark.greenend.org.uk/~sgtatham/halibut/halibut-1.2/halibut-1.2.tar.gz
description :
	 Yet another free document preparation system
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "prefix=#{prefix}", "mandir=#{man}", "all"
	 system "make", "-C", "doc", "prefix=#{prefix}", "mandir=#{man}"
	 system "make", "prefix=#{prefix}", "mandir=#{man}", "install"
