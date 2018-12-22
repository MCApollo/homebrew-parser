name :
	 Avra
homepage :
	 https://avra.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/avra/1.3.0/avra-1.3.0.tar.bz2
description :
	 Assember for the Atmel AVR microcontroller family
build_deps :
	 autoconf
	 automake
link_deps :
conflicts :
patches :
	 https://gist.githubusercontent.com/adammck/7e4a14f7dd4cc58eea8afa99d1ad9f5d/raw/5cdbfe5ac310a12cae6671502697737d56827b05/avra-fix-osx.patch
EOF_patch :
install :
	 touch "NEWS"
	 touch "ChangeLog"
	 cd "src" do
	 system "./bootstrap"
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
	 end
	 pkgshare.install Dir["includes/*"]
