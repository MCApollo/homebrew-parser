name :
	 Wtf
homepage :
	 https://sourceforge.net/projects/bsdwtf/
url :
	 https://downloads.sourceforge.net/project/bsdwtf/wtf-20181212.tar.gz
description :
	 Translate common Internet acronyms
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 inreplace %w[wtf wtf.6], "/usr/share", share
	 bin.install "wtf"
	 man6.install "wtf.6"
	 (share+"misc").install %w[acronyms acronyms.comp]
	 (share+"misc").install "acronyms-o.real" => "acronyms-o"
