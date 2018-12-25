name :
	 Curlish
homepage :
	 https://pythonhosted.org/curlish/
url :
	 https://github.com/fireteam/curlish/archive/1.22.tar.gz
description :
	 Curl wrapper that adds support for OAuth 2.0
build_deps :
link_deps :
	 python@2
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 bin.install "curlish.py" => "curlish"
