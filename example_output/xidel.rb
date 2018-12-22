name :
	 Xidel
homepage :
	 http://www.videlibri.de/xidel.html
url :
	 https://github.com/benibela/xidel/releases/download/Xidel_0.9.8/xidel-0.9.8.src.tar.gz
description :
	 XPath/XQuery 3.0, JSONiq interpreter to extract data from HTML/XML/JSON
build_deps :
link_deps :
	 fpc
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 cd "programs/internet/xidel" do
	 system "./build.sh"
	 bin.install "xidel"
	 man1.install "meta/xidel.1"
	 end
