name :
	 Nanomsgxx
homepage :
	 https://achille-roussel.github.io/nanomsgxx/doc/nanomsgxx.7.html
url :
	 https://github.com/achille-roussel/nanomsgxx/archive/0.2.tar.gz
description :
	 Nanomsg binding for C++11
build_deps :
	 pkg-config
link_deps :
	 nanomsg
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = %W[
	 --static
	 --shared
	 --prefix=#{prefix}
	 ]
	 system "python", "./waf", "configure", *args
	 system "python", "./waf", "build"
	 system "python", "./waf", "install"
