name :
	 Ne
homepage :
	 http://ne.di.unimi.it/
url :
	 https://github.com/vigna/ne/archive/3.1.2.tar.gz
description :
	 The nice editor
build_deps :
	 texinfo
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 cd "src" do
	 system "make"
	 end
	 system "make", "build", "PREFIX=#{prefix}", "install"
