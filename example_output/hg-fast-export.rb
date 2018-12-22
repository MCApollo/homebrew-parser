name :
	 HgFastExport
homepage :
	 https://repo.or.cz/fast-export.git
url :
	 https://github.com/frej/fast-export/archive/v180610.tar.gz
description :
	 Fast Mercurial to Git converter
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 bin.install "hg-fast-export.py", "hg-fast-export.sh",
	 "hg-reset.py", "hg-reset.sh",
	 "hg2git.py"
