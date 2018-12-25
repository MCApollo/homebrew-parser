name :
	 FseventWatch
homepage :
	 https://github.com/proger/fsevent_watch
url :
	 https://github.com/proger/fsevent_watch/archive/v0.1.tar.gz
description :
	 macOS FSEvents client
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
	 bin.mkpath
	 system "make", "install", "PREFIX=#{prefix}", "CFLAGS=-DCLI_VERSION=\\\"#{version}\\\""
