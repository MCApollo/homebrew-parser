name :
	 Reaver
homepage :
	 https://code.google.com/archive/p/reaver-wps/
url :
	 https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/reaver-wps/reaver-1.4.tar.gz
description :
	 Implements brute force attack to recover WPA/WPA2 passkeys
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://gist.githubusercontent.com/syndicut/6134996/raw/16f1b4336c104375ff93a88858809eced53c1171/reaver-osx.diff
EOF_patch :
install :
	 man1.install "docs/reaver.1.gz"
	 prefix.install_metafiles "docs"
	 cd "src"
	 system "./configure", "--prefix=#{prefix}"
	 system "make"
	 bin.mkpath
	 system "make", "install"
