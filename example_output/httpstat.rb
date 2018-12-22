name :
	 Httpstat
homepage :
	 https://github.com/reorx/httpstat
url :
	 https://github.com/reorx/httpstat/archive/1.2.1.tar.gz
description :
	 Curl statistics made simple
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 bin.install "httpstat.py" => "httpstat"
