name :
	 Neatvi
homepage :
	 https://repo.or.cz/neatvi.git
url :
	 https://repo.or.cz/neatvi.git
description :
	 ex/vi clone for editing bidirectional utf-8 text
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "vi" => "neatvi"
