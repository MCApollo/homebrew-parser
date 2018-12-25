name :
	 ColorCode
homepage :
	 http://colorcode.laebisch.com/
url :
	 http://colorcode.laebisch.com/download/ColorCode-0.8.5.tar.gz
description :
	 Free advanced MasterMind clone
build_deps :
link_deps :
	 qt
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "qmake"
	 system "make"
	 prefix.install "ColorCode.app"
	 bin.write_exec_script "#{prefix}/ColorCode.app/Contents/MacOS/colorcode"
