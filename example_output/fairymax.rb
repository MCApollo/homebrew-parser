name :
	 Fairymax
homepage :
	 https://www.chessvariants.com/index/msdisplay.php?itemid=MSfairy-max
url :
	 http://hgm.nubati.net/git/fairymax.git
description :
	 AI for playing Chess variants
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "all",
	 "INI_F=#{pkgshare}/fmax.ini",
	 "INI_Q=#{pkgshare}/qmax.ini"
	 bin.install "fairymax", "shamax", "maxqi"
	 pkgshare.install Dir["data/*.ini"]
	 man6.install "fairymax.6.gz"
