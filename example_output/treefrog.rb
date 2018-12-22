name :
	 Treefrog
homepage :
	 http://www.treefrogframework.org/
url :
	 https://github.com/treefrogframework/treefrog-framework/archive/v1.22.0.tar.gz
description :
	 High-speed C++ MVC Framework for Web Application
build_deps :
link_deps :
	 :xcode
	 :macos
	 qt
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 cd "src" do
	 system "make"
	 system "make", "install"
	 end
	 cd "tools" do
	 system "make"
	 system "make", "install"
	 end
