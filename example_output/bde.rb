name :
	 Bde
homepage :
	 https://github.com/bloomberg/bde
url :
	 https://github.com/bloomberg/bde/archive/BDE_3.0.0.0.tar.gz
description :
	 Basic Development Environment: foundational C++ libraries used at Bloomberg
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 ['bde-tools']
	 ['https://github.com/bloomberg/bde-tools/archive/v1.0.tar.gz']
patches :
EOF_patch :
install :
	 buildpath.install resource("bde-tools")
	 system "python", "./bin/waf", "configure", "--prefix=#{prefix}"
	 system "python", "./bin/waf", "build"
	 system "python", "./bin/waf", "install"
