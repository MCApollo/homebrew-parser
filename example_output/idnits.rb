name :
	 Idnits
homepage :
	 https://tools.ietf.org/tools/idnits/
url :
	 https://tools.ietf.org/tools/idnits/idnits-2.15.01.tgz
description :
	 Looks for problems in internet draft formatting
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 ['test']
	 ['https://tools.ietf.org/id/draft-ietf-tcpm-undeployed-03.txt']
patches :
EOF_patch :
install :
	 bin.install "idnits"
