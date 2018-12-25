name :
	 Libvpx
homepage :
	 https://www.webmproject.org/code/
url :
	 https://github.com/webmproject/libvpx/archive/v1.7.0.tar.gz
description :
	 VP8/VP9 video codec
build_deps :
	 yasm
link_deps :
	 :macos
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = %W[
	 --prefix=#{prefix}
	 --disable-dependency-tracking
	 --disable-examples
	 --disable-unit-tests
	 --enable-pic
	 ]
	 args << "--disable-avx512" if MacOS.version <= :el_capitan
	 mkdir "macbuild" do
	 system "../configure", *args
	 system "make", "install"
	 end
