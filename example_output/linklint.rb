name :
	 Linklint
homepage :
	 http://linklint.org
url :
	 http://linklint.org/download/linklint-2.3.5.tar.gz
description :
	 Link checker and web site maintenance tool
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
	 mv "READ_ME.txt", "README"
	 doc.install "README"
	 bin.install "linklint-#{version}" => "linklint"
