name :
	 Logtalk
homepage :
	 https://logtalk.org/
url :
	 https://github.com/LogtalkDotOrg/logtalk3/archive/lgt3210stable.tar.gz
description :
	 Object-oriented logic programming language
build_deps :
link_deps :
	 gnu-prolog
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 cd("scripts") { system "./install.sh", "-p", prefix }
